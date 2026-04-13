import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/shape_result.dart';
import '../repositories/shape_repository.dart';

@injectable
class AnalyzeShapeSimilarity {
  final ShapeRepository _repository;

  const AnalyzeShapeSimilarity(this._repository);

  Future<Either<Failure, ShapeResult>> call({
    required String runRecordId,
    required String missionId,
    required List<List<double>> runVertices,
  }) =>
      _repository.analyzeAndSaveResult(
        runRecordId: runRecordId,
        missionId: missionId,
        runVertices: runVertices,
      );
}
