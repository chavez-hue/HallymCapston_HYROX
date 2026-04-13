import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/feed_item.dart';
import '../repositories/feed_repository.dart';

@injectable
class GetFeed {
  final FeedRepository _repository;

  const GetFeed(this._repository);

  Future<Either<Failure, List<FeedItem>>> call({int limit = 20}) =>
      _repository.getFeed(limit: limit);
}
