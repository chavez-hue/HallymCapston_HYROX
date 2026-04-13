import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/shape_mission.dart';
import '../entities/shape_result.dart';

abstract interface class ShapeRepository {
  Future<Either<Failure, List<ShapeMission>>> getMissions();

  Future<Either<Failure, ShapeMission>> getMission(String missionId);

  Future<Either<Failure, ShapeMission>> createCustomMission(
    ShapeMission mission,
  );

  Future<Either<Failure, ShapeResult>> analyzeAndSaveResult({
    required String runRecordId,
    required String missionId,
    required List<List<double>> runVertices,
  });
}
