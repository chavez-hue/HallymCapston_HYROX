import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/gps_point.dart';
import '../../domain/entities/run_record.dart';

part 'running_state.freezed.dart';

@freezed
sealed class RunningState with _$RunningState {
  const factory RunningState.idle() = RunningIdle;

  const factory RunningState.active({
    required List<GpsPoint> route,
    required double distanceKm,
    required Duration elapsed,
    required String currentPace,
  }) = RunningActive;

  const factory RunningState.paused({
    required List<GpsPoint> route,
    required double distanceKm,
    required Duration elapsed,
  }) = RunningPaused;

  const factory RunningState.finished(RunRecord record) = RunningFinished;

  const factory RunningState.error(String message) = RunningError;
}
