// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'run_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RunRecordModelImpl _$$RunRecordModelImplFromJson(Map<String, dynamic> json) =>
    _$RunRecordModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: DateTime.parse(json['endedAt'] as String),
      route: (json['route'] as List<dynamic>)
          .map((e) => GpsPointModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      distanceKm: (json['distanceKm'] as num).toDouble(),
      durationSeconds: (json['durationSeconds'] as num).toInt(),
      avgPace: json['avgPace'] as String,
      shapeId: json['shapeId'] as String?,
      shapeSimilarity: (json['shapeSimilarity'] as num?)?.toDouble() ?? 0.0,
      mode: json['mode'] as String? ?? 'random',
      shapeLabel: json['shapeLabel'] as String?,
    );

Map<String, dynamic> _$$RunRecordModelImplToJson(
  _$RunRecordModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'startedAt': instance.startedAt.toIso8601String(),
  'endedAt': instance.endedAt.toIso8601String(),
  'route': instance.route,
  'distanceKm': instance.distanceKm,
  'durationSeconds': instance.durationSeconds,
  'avgPace': instance.avgPace,
  'shapeId': instance.shapeId,
  'shapeSimilarity': instance.shapeSimilarity,
  'mode': instance.mode,
  'shapeLabel': instance.shapeLabel,
};

_$GpsPointModelImpl _$$GpsPointModelImplFromJson(Map<String, dynamic> json) =>
    _$GpsPointModelImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      altitude: (json['altitude'] as num?)?.toDouble(),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$GpsPointModelImplToJson(_$GpsPointModelImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timestamp': instance.timestamp.toIso8601String(),
      'altitude': instance.altitude,
      'accuracy': instance.accuracy,
    };
