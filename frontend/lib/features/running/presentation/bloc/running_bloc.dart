import 'dart:async';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/shape_similarity.dart';
import '../../domain/entities/gps_point.dart';
import '../../domain/entities/run_record.dart';
import '../../domain/usecases/start_run.dart';
import '../../domain/usecases/stop_run.dart';
import 'running_event.dart';
import 'running_state.dart';

@injectable
class RunningBloc extends Bloc<RunningEvent, RunningState> {
  final StartRun _startRun;
  final StopRun _stopRun;

  StreamSubscription<GpsPoint>? _gpsSub;
  Timer? _timer;
  final List<GpsPoint> _route = [];
  late DateTime _startTime;
  Duration _pausedAccumulated = Duration.zero;
  DateTime? _pausedAt;
  String _mode = 'random';
  String? _shapeLabel;

  RunningBloc(this._startRun, this._stopRun) : super(const RunningState.idle()) {
    on<StartRequested>(_onStartRequested);
    on<PauseRequested>(_onPauseRequested);
    on<ResumeRequested>(_onResumeRequested);
    on<StopRequested>(_onStopRequested);
    on<GpsUpdated>(_onGpsUpdated);
    on<TimerTicked>(_onTimerTicked);
    on<ErrorOccurred>(_onErrorOccurred);
  }

  Future<void> _onStartRequested(
    StartRequested event,
    Emitter<RunningState> emit,
  ) async {
    _route.clear();
    _pausedAccumulated = Duration.zero;
    _pausedAt = null;
    _startTime = DateTime.now();
    _mode = event.mode;
    _shapeLabel = event.shapeLabel;

    emit(RunningState.active(
      route: const [],
      distanceKm: 0,
      elapsed: Duration.zero,
      currentPace: "--'--\"",
    ));

    _startTimer();
    _subscribeGps();
  }

  Future<void> _onPauseRequested(
    PauseRequested event,
    Emitter<RunningState> emit,
  ) async {
    _timer?.cancel();
    await _gpsSub?.cancel();
    _pausedAt = DateTime.now();
    _pausedAccumulated += DateTime.now().difference(_startTime);

    emit(RunningState.paused(
      route: List.unmodifiable(_route),
      distanceKm: _calcDistance(),
      elapsed: _pausedAccumulated,
    ));
  }

  Future<void> _onResumeRequested(
    ResumeRequested event,
    Emitter<RunningState> emit,
  ) async {
    _startTime = DateTime.now();
    _pausedAt = null;

    emit(RunningState.active(
      route: List.unmodifiable(_route),
      distanceKm: _calcDistance(),
      elapsed: _pausedAccumulated,
      currentPace: _calcPace(_calcDistance(), _pausedAccumulated),
    ));

    _startTimer();
    _subscribeGps();
  }

  Future<void> _onStopRequested(
    StopRequested event,
    Emitter<RunningState> emit,
  ) async {
    _timer?.cancel();
    await _gpsSub?.cancel();

    final elapsed = _pausedAccumulated +
        (_pausedAt == null ? DateTime.now().difference(_startTime) : Duration.zero);
    final distanceKm = _calcDistance();
    final now = DateTime.now();

    // 랜덤 모드일 때 DTW로 유사도 계산 후 저장
    double shapeSimilarity = 0.0;
    final avgPaceStr = _calcPace(distanceKm, elapsed);
    if (_mode == 'random' && _shapeLabel != null && _route.length >= 3) {
      final analysis = ShapeSimilarityCalculator.analyze(
        _route,
        _shapeLabel!,
        distanceKm: distanceKm,
        avgPace: avgPaceStr,
      );
      shapeSimilarity = analysis.score;
    }

    final userId =
        FirebaseAuth.instance.currentUser?.uid ?? 'anonymous';
    final record = RunRecord(
      id: now.millisecondsSinceEpoch.toString(),
      userId: userId,
      startedAt: _startTime,
      endedAt: now,
      route: List.unmodifiable(_route),
      distanceKm: distanceKm,
      duration: elapsed,
      avgPace: avgPaceStr,
      mode: _mode,
      shapeLabel: _shapeLabel,
      shapeSimilarity: shapeSimilarity,
    );

    emit(RunningState.finished(record));

    // 백그라운드에서 저장 시도 (실패해도 UI에 영향 없음)
    await _stopRun(record);
  }

  Future<void> _onGpsUpdated(
    GpsUpdated event,
    Emitter<RunningState> emit,
  ) async {
    // 일시정지/정지 후 큐에 남은 GPS 이벤트는 무시
    if (state is! RunningActive) return;

    _route.add(GpsPoint(
      latitude: event.latitude,
      longitude: event.longitude,
      timestamp: event.timestamp,
    ));

    final elapsed = _pausedAccumulated + DateTime.now().difference(_startTime);
    final distanceKm = _calcDistance();

    emit(RunningState.active(
      route: List.unmodifiable(_route),
      distanceKm: distanceKm,
      elapsed: elapsed,
      currentPace: _calcPace(distanceKm, elapsed),
    ));
  }

  Future<void> _onTimerTicked(
    TimerTicked event,
    Emitter<RunningState> emit,
  ) async {
    final current = state;
    if (current is! RunningActive) return;

    final elapsed = _pausedAccumulated + DateTime.now().difference(_startTime);

    emit(RunningState.active(
      route: current.route,
      distanceKm: current.distanceKm,
      elapsed: elapsed,
      currentPace: current.currentPace,
    ));
  }

  Future<void> _onErrorOccurred(
    ErrorOccurred event,
    Emitter<RunningState> emit,
  ) async {
    _timer?.cancel();
    emit(RunningState.error(event.message));
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(const RunningEvent.timerTicked());
    });
  }

  void _subscribeGps() {
    _gpsSub?.cancel();
    _gpsSub = _startRun().listen(
      (point) => add(RunningEvent.gpsUpdated(
        latitude: point.latitude,
        longitude: point.longitude,
        timestamp: point.timestamp,
      )),
      onError: (e) => add(RunningEvent.errorOccurred(e.toString())),
      cancelOnError: true,
    );
  }

  // Haversine 공식으로 두 GPS 포인트 간 거리(km) 계산
  double _haversine(GpsPoint a, GpsPoint b) {
    const r = 6371.0;
    final dLat = _toRad(b.latitude - a.latitude);
    final dLon = _toRad(b.longitude - a.longitude);
    final sinLat = sin(dLat / 2);
    final sinLon = sin(dLon / 2);
    final h = sinLat * sinLat +
        cos(_toRad(a.latitude)) * cos(_toRad(b.latitude)) * sinLon * sinLon;
    return 2 * r * asin(sqrt(h));
  }

  double _toRad(double deg) => deg * pi / 180;

  double _calcDistance() {
    if (_route.length < 2) return 0.0;
    double total = 0.0;
    for (int i = 1; i < _route.length; i++) {
      total += _haversine(_route[i - 1], _route[i]);
    }
    return total;
  }

  String _calcPace(double distanceKm, Duration elapsed) {
    if (distanceKm < 0.001) return "--'--\"";
    final paceSeconds = elapsed.inSeconds / distanceKm;
    final min = (paceSeconds ~/ 60).toString().padLeft(2, '0');
    final sec = (paceSeconds % 60).toInt().toString().padLeft(2, '0');
    return "$min'$sec\"";
  }

  @override
  Future<void> close() async {
    _timer?.cancel();
    await _gpsSub?.cancel();
    return super.close();
  }
}
