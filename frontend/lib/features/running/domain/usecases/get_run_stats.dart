import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/run_record.dart';
import '../repositories/run_repository.dart';

@injectable
class GetRunStats {
  final RunRepository _repository;

  const GetRunStats(this._repository);

  Future<Either<Failure, List<RunRecord>>> call(String userId) =>
      _repository.getRunHistory(userId);
}
