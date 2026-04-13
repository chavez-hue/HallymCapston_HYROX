import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/gps_point.dart';
import '../entities/run_record.dart';

abstract interface class RunRepository {
  Stream<GpsPoint> watchGpsStream();

  Future<Either<Failure, RunRecord>> saveRunRecord(RunRecord record);

  Future<Either<Failure, List<RunRecord>>> getRunHistory(String userId);

  Future<Either<Failure, RunRecord>> getRunRecord(String recordId);
}
