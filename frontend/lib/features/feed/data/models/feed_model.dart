import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/feed_item.dart';

part 'feed_model.freezed.dart';
part 'feed_model.g.dart';

@freezed
class FeedModel with _$FeedModel {
  const factory FeedModel({
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
  }) = _FeedModel;

  factory FeedModel.fromJson(Map<String, dynamic> json) =>
      _$FeedModelFromJson(json);
}

extension FeedModelX on FeedModel {
  FeedItem toEntity() => FeedItem(
        id: id,
        userId: userId,
        userName: userName,
        userPhotoUrl: userPhotoUrl,
        content: content,
        createdAt: createdAt,
        runRecordId: runRecordId,
        shapeImageUrl: shapeImageUrl,
        likeCount: likeCount,
        isLikedByMe: isLikedByMe,
      );
}
