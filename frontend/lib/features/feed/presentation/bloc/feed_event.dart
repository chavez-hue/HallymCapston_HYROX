import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_event.freezed.dart';

@freezed
sealed class FeedEvent with _$FeedEvent {
  const factory FeedEvent.loadRequested() = FeedLoadRequested;

  const factory FeedEvent.postRequested({
    required String userId,
    required String content,
    String? runRecordId,
  }) = FeedPostRequested;

  const factory FeedEvent.likeToggled(String feedId, bool isLiked) =
      FeedLikeToggled;
}
