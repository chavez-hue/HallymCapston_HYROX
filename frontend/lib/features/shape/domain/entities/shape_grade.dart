/// 도형 러닝 인정 등급.
///
/// 인정 조건 3가지를 모두 충족할 때 거리에 따라 등급이 결정된다.
///   Bronze : 1 km 이상 ~ 3 km 미만
///   Silver : 3 km 이상 ~ 5 km 미만
///   Gold   : 5 km 이상
enum ShapeGrade { bronze, silver, gold }

extension ShapeGradeX on ShapeGrade {
  String get label => switch (this) {
        ShapeGrade.bronze => 'Bronze',
        ShapeGrade.silver => 'Silver',
        ShapeGrade.gold => 'Gold',
      };

  /// 거리(km)를 받아 등급을 반환한다. 인정 조건 충족 여부는 호출 전에 확인해야 한다.
  static ShapeGrade fromDistance(double distanceKm) {
    if (distanceKm < 3.0) return ShapeGrade.bronze;
    if (distanceKm < 5.0) return ShapeGrade.silver;
    return ShapeGrade.gold;
  }

  /// 인정 조건 3가지 모두 충족하는지 확인하고 등급을 반환한다. 미충족 시 null.
  ///
  /// 조건:
  ///   1. [similarityScore] >= 70
  ///   2. [distanceKm] >= 1.0
  ///   3. [avgPaceStr] <= 10분/km (600초), 포맷 "MM'SS\"" 또는 "MM:SS"
  static ShapeGrade? check({
    required double distanceKm,
    required String avgPaceStr,
    required double similarityScore,
  }) {
    if (similarityScore < 70.0) return null;
    if (distanceKm < 1.0) return null;
    final paceSeconds = _parsePaceSeconds(avgPaceStr);
    if (paceSeconds == null || paceSeconds > 600) return null;
    return fromDistance(distanceKm);
  }

  static int? _parsePaceSeconds(String pace) {
    final cleaned = pace.replaceAll("'", ':').replaceAll('"', '').trim();
    final parts = cleaned.split(':');
    if (parts.length != 2) return null;
    final min = int.tryParse(parts[0].trim());
    final sec = int.tryParse(parts[1].trim());
    if (min == null || sec == null) return null;
    return min * 60 + sec;
  }
}
