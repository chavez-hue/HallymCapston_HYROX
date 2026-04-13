import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/gps_point.dart';
import '../../domain/entities/run_record.dart';
import '../../domain/repositories/run_repository.dart';
import '../datasources/gps_datasource.dart';
import '../datasources/run_remote_datasource.dart';
import '../models/run_record_model.dart'; // toModel(), toEntity() extensions

@LazySingleton(as: RunRepository)
class RunRepositoryImpl implements RunRepository {
  final GpsDataSource _gps;
  final RunRemoteDataSource _remote;

  const RunRepositoryImpl(this._gps, this._remote);

  @override
  Stream<GpsPoint> watchGpsStream() => _gps.watchPosition();

  @override
  Future<Either<Failure, RunRecord>> saveRunRecord(RunRecord record) async {
    try {
      final saved = await _remote.saveRunRecord(record.toModel());
      return Right(saved.toEntity());
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RunRecord>>> getRunHistory(
      String userId) async {
    try {
      final models = await _remote.getRunHistory(userId);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RunRecord>> getRunRecord(String recordId) async {
    try {
      final model = await _remote.getRunRecord(recordId);
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
