import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_item.freezed.dart';

@freezed
class FeedItem with _$FeedItem {
  const factory FeedItem({
    required String id,
    required String userId,
    required String userName,
    String? userPhotoUrl,
    required String content,
    required DateTime createdAt,
    String? runRecordId,
    String? shapeImageUrl,
    @Default(0) int likeCount,
    @Default(false) bool isLikedByMe,
  }) = _FeedItem;
}
