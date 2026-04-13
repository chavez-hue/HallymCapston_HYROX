import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/feed_item.dart';

abstract interface class FeedRepository {
  Future<Either<Failure, List<FeedItem>>> getFeed({int limit = 20});

  Future<Either<Failure, FeedItem>> postFeed({
    required String userId,
    required String content,
    String? runRecordId,
  });

  Future<Either<Failure, Unit>> likeFeed(String feedId);

  Future<Either<Failure, Unit>> unlikeFeed(String feedId);
}
