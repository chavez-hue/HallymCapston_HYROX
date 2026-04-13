import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/shape_mission.dart';
import '../../domain/entities/shape_result.dart';
import '../../domain/repositories/shape_repository.dart';
import '../datasources/shape_remote_datasource.dart';
import '../models/shape_model.dart';
import '../utils/shape_dtw_analyzer.dart';

@LazySingleton(as: ShapeRepository)
class ShapeRepositoryImpl implements ShapeRepository {
  final ShapeRemoteDataSource _remote;

  const ShapeRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, List<ShapeMission>>> getMissions() async {
    try {
      final models = await _remote.getMissions();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShapeMission>> getMission(String missionId) async {
    try {
      final model = await _remote.getMission(missionId);
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShapeMission>> createCustomMission(
    ShapeMission mission,
  ) async {
    try {
      final model = ShapeMissionModel(
        id: mission.id,
        name: mission.name,
        type: mission.type.name,
        targetVertices: mission.targetVertices,
        description: mission.description,
        difficulty: mission.difficulty,
      );
      final saved = await _remote.createMission(model);
      return Right(saved.toEntity());
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShapeResult>> analyzeAndSaveResult({
    required String runRecordId,
    required String missionId,
    required List<List<double>> runVertices,
  }) async {
    try {
      // 미션 정보 조회 (도형 타입 및 목표 좌표 획득)
      final missionModel = await _remote.getMission(missionId);
      final mission = missionModel.toEntity();

      // 목표 도형 기준 경로 결정:
      //   미션에 targetVertices가 있으면 그것을 사용, 없으면 하드코딩 기준 경로 사용
      final rawTarget = mission.targetVertices.isNotEmpty
          ? mission.targetVertices
          : ShapeDtwAnalyzer.getReferencePath(mission.type);

      // 1단계: 정규화 (0~1, 종횡비 유지, 중앙 정렬)
      final normalizedRun = ShapeDtwAnalyzer.normalizePoints(runVertices);
      final normalizedTarget = ShapeDtwAnalyzer.normalizePoints(rawTarget);

      // 2단계: 등간격 리샘플링 (각 100점)
      final resampledRun = ShapeDtwAnalyzer.resamplePath(normalizedRun);
      final resampledTarget = ShapeDtwAnalyzer.resamplePath(normalizedTarget);

      // 3~4단계: DTW 계산 → 0~100점 변환
      final score = ShapeDtwAnalyzer.computeSimilarityScore(
        resampledRun,
        resampledTarget,
      );

      final model = ShapeResultModel(
        runRecordId: runRecordId,
        missionId: missionId,
        similarityScore: score,
        isPassed: score >= 70,
        completedAt: DateTime.now(),
      );
      final saved = await _remote.saveResult(model);
      return Right(saved.toEntity());
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
