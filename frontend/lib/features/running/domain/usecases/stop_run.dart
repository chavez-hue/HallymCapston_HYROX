import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/run_record.dart';
import '../repositories/run_repository.dart';

/// Persists the completed run record and returns the saved entity.
@injectable
class StopRun {
  final RunRepository _repository;

  const StopRun(this._repository);

  Future<Either<Failure, RunRecord>> call(RunRecord record) =>
      _repository.saveRunRecord(record);
}
