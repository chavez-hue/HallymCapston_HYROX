// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedModelImpl _$$FeedModelImplFromJson(Map<String, dynamic> json) =>
    _$FeedModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userPhotoUrl: json['userPhotoUrl'] as String?,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      runRecordId: json['runRecordId'] as String?,
      shapeImageUrl: json['shapeImageUrl'] as String?,
      likeCount: (json['likeCount'] as num?)?.toInt() ?? 0,
      isLikedByMe: json['isLikedByMe'] as bool? ?? false,
    );

Map<String, dynamic> _$$FeedModelImplToJson(_$FeedModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'userPhotoUrl': instance.userPhotoUrl,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'runRecordId': instance.runRecordId,
      'shapeImageUrl': instance.shapeImageUrl,
      'likeCount': instance.likeCount,
      'isLikedByMe': instance.isLikedByMe,
    };
