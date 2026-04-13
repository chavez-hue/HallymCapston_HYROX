// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shape_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShapeMissionModelImpl _$$ShapeMissionModelImplFromJson(
  Map<String, dynamic> json,
) => _$ShapeMissionModelImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  type: json['type'] as String,
  targetVertices: (json['targetVertices'] as List<dynamic>)
      .map(
        (e) => (e as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
      )
      .toList(),
  description: json['description'] as String?,
  difficulty: (json['difficulty'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$$ShapeMissionModelImplToJson(
  _$ShapeMissionModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'targetVertices': instance.targetVertices,
  'description': instance.description,
  'difficulty': instance.difficulty,
};

_$ShapeResultModelImpl _$$ShapeResultModelImplFromJson(
  Map<String, dynamic> json,
) => _$ShapeResultModelImpl(
  runRecordId: json['runRecordId'] as String,
  missionId: json['missionId'] as String,
  similarityScore: (json['similarityScore'] as num).toDouble(),
  isPassed: json['isPassed'] as bool,
  completedAt: DateTime.parse(json['completedAt'] as String),
  grade: json['grade'] as String?,
);

Map<String, dynamic> _$$ShapeResultModelImplToJson(
  _$ShapeResultModelImpl instance,
) => <String, dynamic>{
  'runRecordId': instance.runRecordId,
  'missionId': instance.missionId,
  'similarityScore': instance.similarityScore,
  'isPassed': instance.isPassed,
  'completedAt': instance.completedAt.toIso8601String(),
  'grade': instance.grade,
};
