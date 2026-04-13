import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/feed_item.dart';
import '../repositories/feed_repository.dart';

@injectable
class PostFeed {
  final FeedRepository _repository;

  const PostFeed(this._repository);

  Future<Either<Failure, FeedItem>> call({
    required String userId,
    required String content,
    String? runRecordId,
  }) =>
      _repository.postFeed(
        userId: userId,
        content: content,
        runRecordId: runRecordId,
      );
}
