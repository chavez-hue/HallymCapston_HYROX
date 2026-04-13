import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/ranking_entry.dart';
import '../../domain/repositories/ranking_repository.dart';
import '../datasources/ranking_remote_datasource.dart';
import '../models/ranking_model.dart';

@LazySingleton(as: RankingRepository)
class RankingRepositoryImpl implements RankingRepository {
  final RankingRemoteDataSource _remote;

  const RankingRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, List<RankingEntry>>> getGlobalRanking({
    int limit = 50,
    String currentUserId = '',
  }) async {
    try {
      final models = await _remote.getGlobalRanking(
        limit: limit,
        currentUserId: currentUserId,
      );
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RankingEntry>> getMyRanking(String userId) async {
    try {
      final model = await _remote.getMyRanking(userId);
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
