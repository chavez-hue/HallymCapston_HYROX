import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/shape_grade.dart';
import '../../domain/entities/shape_mission.dart';
import '../../domain/entities/shape_result.dart';

part 'shape_model.freezed.dart';
part 'shape_model.g.dart';

@freezed
class ShapeMissionModel with _$ShapeMissionModel {
  const factory ShapeMissionModel({
    required String id,
    required String name,
    required String type,
    required List<List<double>> targetVertices,
    String? description,
    @Default(1) int difficulty,
  }) = _ShapeMissionModel;

  factory ShapeMissionModel.fromJson(Map<String, dynamic> json) =>
      _$ShapeMissionModelFromJson(json);
}

@freezed
class ShapeResultModel with _$ShapeResultModel {
  const factory ShapeResultModel({
    required String runRecordId,
    required String missionId,
    required double similarityScore,
    required bool isPassed,
    required DateTime completedAt,
    String? grade, // 'bronze' | 'silver' | 'gold' | null
  }) = _ShapeResultModel;

  factory ShapeResultModel.fromJson(Map<String, dynamic> json) =>
      _$ShapeResultModelFromJson(json);
}

extension ShapeMissionModelX on ShapeMissionModel {
  ShapeMission toEntity() => ShapeMission(
        id: id,
        name: name,
        type: ShapeType.values.firstWhere(
          (e) => e.name == type,
          orElse: () => ShapeType.custom,
        ),
        targetVertices: targetVertices,
        description: description,
        difficulty: difficulty,
      );
}

extension ShapeResultModelX on ShapeResultModel {
  ShapeResult toEntity() => ShapeResult(
        runRecordId: runRecordId,
        missionId: missionId,
        similarityScore: similarityScore,
        isPassed: isPassed,
        completedAt: completedAt,
        grade: _gradeFromString(grade),
      );

  static ShapeGrade? _gradeFromString(String? s) => switch (s) {
        'bronze' => ShapeGrade.bronze,
        'silver' => ShapeGrade.silver,
        'gold' => ShapeGrade.gold,
        _ => null,
      };
}
