import '../../../shape/domain/entities/shape_grade.dart';

/// 랜덤 모드에서 인정 조건 3가지를 모두 충족한 러닝 기록 요약.
class CollectionItem {
  final String id;
  final String shapeLabel;

  /// 0–100 점 (DTW 유사도 점수)
  final double score;
  final DateTime date;
  final double distanceKm;

  /// 거리 기반 등급 (Bronze / Silver / Gold)
  final ShapeGrade grade;

  const CollectionItem({
    required this.id,
    required this.shapeLabel,
    required this.score,
    required this.date,
    required this.distanceKm,
    required this.grade,
  });
}
