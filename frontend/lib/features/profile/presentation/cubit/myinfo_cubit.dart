import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/collection_item.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../../running/domain/repositories/run_repository.dart';
import '../../../shape/domain/entities/shape_grade.dart';

// ── States ──────────────────────────────────────────────────────

abstract class MyInfoState {}

class MyInfoInitial extends MyInfoState {}

class MyInfoLoading extends MyInfoState {}

class MyInfoLoaded extends MyInfoState {
  final String name;
  final String email;
  final String? photoUrl;

  /// 랜덤 모드 70점 이상 인정 횟수
  final int puzzleCount;

  /// 전체 러닝 평균 페이스 (mm'ss" 포맷)
  final String avgPace;

  /// 누적 러닝 시간 (포맷 문자열)
  final String totalRunTime;

  /// Beginner / Runner / Expert / Master
  final String level;

  /// 인정된 러닝만 모음 (날짜 내림차순)
  final List<CollectionItem> collectionItems;

  MyInfoLoaded({
    required this.name,
    required this.email,
    this.photoUrl,
    required this.puzzleCount,
    required this.avgPace,
    required this.totalRunTime,
    required this.level,
    required this.collectionItems,
  });
}

class MyInfoError extends MyInfoState {
  final String message;
  MyInfoError(this.message);
}

// ── Cubit ────────────────────────────────────────────────────────

class MyInfoCubit extends Cubit<MyInfoState> {
  final ProfileRepository _profileRepo;
  final RunRepository _runRepo;

  MyInfoCubit({
    required ProfileRepository profileRepo,
    required RunRepository runRepo,
  })  : _profileRepo = profileRepo,
        _runRepo = runRepo,
        super(MyInfoInitial());

  Future<void> load(String userId) async {
    emit(MyInfoLoading());

    final profileResult = await _profileRepo.getProfile(userId);
    final runsResult = await _runRepo.getRunHistory(userId);

    // 프로필 에러
    if (profileResult.isLeft()) {
      final msg = profileResult.fold((f) => f.toString(), (_) => '');
      emit(MyInfoError(msg));
      return;
    }
    // 러닝 기록 에러
    if (runsResult.isLeft()) {
      final msg = runsResult.fold((f) => f.toString(), (_) => '');
      emit(MyInfoError(msg));
      return;
    }

    final profile = profileResult.getOrElse(() => throw StateError('unreachable'));
    final runs = runsResult.getOrElse(() => []);

    // ── 통계 계산 ──────────────────────────────────────────────

    // 인정된 러닝 (랜덤 + 인정 조건 3가지 모두 충족)
    final passedRuns = runs
        .where(
          (r) =>
              r.mode == 'random' &&
              ShapeGradeX.check(
                    distanceKm: r.distanceKm,
                    avgPaceStr: r.avgPace,
                    similarityScore: r.shapeSimilarity,
                  ) !=
                  null,
        )
        .toList();

    final puzzleCount = passedRuns.length;

    // 레벨
    final String level;
    if (puzzleCount >= 20) {
      level = 'Master';
    } else if (puzzleCount >= 10) {
      level = 'Expert';
    } else if (puzzleCount >= 5) {
      level = 'Runner';
    } else {
      level = 'Beginner';
    }

    // 누적 시간
    final totalSeconds = runs.fold(0, (sum, r) => sum + r.duration.inSeconds);
    final totalDur = Duration(seconds: totalSeconds);
    final h = totalDur.inHours;
    final m = totalDur.inMinutes.remainder(60);
    final s = totalDur.inSeconds.remainder(60);
    final String totalRunTime;
    if (h > 0) {
      totalRunTime = '${h}h ${m.toString().padLeft(2, '0')}m';
    } else if (m > 0) {
      totalRunTime = '${m}m ${s.toString().padLeft(2, '0')}s';
    } else {
      totalRunTime = '${s}s';
    }

    // 평균 페이스
    final totalDistanceKm =
        runs.fold(0.0, (sum, r) => sum + r.distanceKm);
    String avgPace = "--'--\"";
    if (totalDistanceKm > 0 && totalSeconds > 0) {
      final paceSeconds = totalSeconds / totalDistanceKm;
      final pm = (paceSeconds ~/ 60).toString().padLeft(2, '0');
      final ps = (paceSeconds % 60).toInt().toString().padLeft(2, '0');
      avgPace = "$pm'$ps\"";
    }

    // 컬렉션 아이템 (날짜 내림차순)
    final collectionItems = passedRuns
        .map((r) => CollectionItem(
              id: r.id,
              shapeLabel: r.shapeLabel ?? '도형',
              score: r.shapeSimilarity,
              date: r.endedAt,
              distanceKm: r.distanceKm,
              grade: ShapeGradeX.fromDistance(r.distanceKm),
            ))
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));

    emit(MyInfoLoaded(
      name: profile.name,
      email: profile.email,
      photoUrl: profile.photoUrl,
      puzzleCount: puzzleCount,
      avgPace: avgPace,
      totalRunTime: totalRunTime,
      level: level,
      collectionItems: collectionItems,
    ));
  }
}
