// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String?,
      puzzleCount: (json['puzzleCount'] as num?)?.toInt() ?? 0,
      avgPace: json['avgPace'] as String? ?? '',
      totalRunTime: json['totalRunTime'] as String? ?? '',
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'puzzleCount': instance.puzzleCount,
      'avgPace': instance.avgPace,
      'totalRunTime': instance.totalRunTime,
    };
