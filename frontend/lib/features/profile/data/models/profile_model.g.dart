// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String?,
      puzzleCount: (json['puzzleCount'] as num?)?.toInt() ?? 0,
      totalDistanceKm: (json['totalDistanceKm'] as num?)?.toDouble() ?? 0.0,
      bestPace: json['bestPace'] as String? ?? '',
      totalRunTime: json['totalRunTime'] as String? ?? '',
      level: json['level'] as String? ?? 'Beginner',
      completedShapeIds:
          (json['completedShapeIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'puzzleCount': instance.puzzleCount,
      'totalDistanceKm': instance.totalDistanceKm,
      'bestPace': instance.bestPace,
      'totalRunTime': instance.totalRunTime,
      'level': instance.level,
      'completedShapeIds': instance.completedShapeIds,
    };
