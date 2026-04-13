import 'package:freezed_annotation/freezed_annotation.dart';

import 'shape_grade.dart';

part 'shape_result.freezed.dart';

@freezed
class ShapeResult with _$ShapeResult {
  const factory ShapeResult({
    required String runRecordId,
    required String missionId,
    required double similarityScore, // 0.0 ~ 100.0
    required bool isPassed,
    required DateTime completedAt,
    ShapeGrade? grade,
  }) = _ShapeResult;
}
