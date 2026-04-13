import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/feed_item.dart';
import '../../domain/repositories/feed_repository.dart';
import '../datasources/feed_remote_datasource.dart';
import '../models/feed_model.dart';

@LazySingleton(as: FeedRepository)
class FeedRepositoryImpl implements FeedRepository {
  final FeedRemoteDataSource _remote;

  const FeedRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, List<FeedItem>>> getFeed({int limit = 20}) async {
    try {
      final models = await _remote.getFeed(limit: limit);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, FeedItem>> postFeed({
    required String userId,
    required String content,
    String? runRecordId,
  }) async {
    try {
      final model = await _remote.postFeed(
        userId: userId,
        content: content,
        runRecordId: runRecordId,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> likeFeed(String feedId) async {
    try {
      await _remote.likeFeed(feedId);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> unlikeFeed(String feedId) async {
    try {
      await _remote.unlikeFeed(feedId);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
