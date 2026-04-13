import 'package:freezed_annotation/freezed_annotation.dart';

part 'shape_mission.freezed.dart';

enum ShapeType { triangle, square, star, circle, heart, pentagon, custom }

@freezed
class ShapeMission with _$ShapeMission {
  const factory ShapeMission({
    required String id,
    required String name,
    required ShapeType type,
    required List<List<double>> targetVertices, // normalized [x, y] pairs
    String? description,
    @Default(1) int difficulty,
  }) = _ShapeMission;
}
