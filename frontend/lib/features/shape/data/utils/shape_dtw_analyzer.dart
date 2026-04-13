import 'dart:math';

import '../../domain/entities/shape_mission.dart';

/// GPS 경로와 목표 도형 사이의 유사도를 DTW(Dynamic Time Warping)로 계산.
///
/// 처리 순서:
///   1. 좌표 정규화 (0~1, 종횡비 유지)
///   2. 등간격 리샘플링 (100점)
///   3. DTW 거리 계산 (회전 불변: 시작점 12방향 시도 후 최솟값)
///   4. 0~100점 변환 (70점 이상 통과)
class ShapeDtwAnalyzer {
  ShapeDtwAnalyzer._();

  /// 리샘플링 기준 점 수
  static const int _resampleCount = 100;

  /// 평균 DTW 거리가 이 값 이상이면 0점
  static const double _maxAvgDist = 0.40;

  /// 시작점 이동 시도 횟수 (회전 불변성)
  static const int _rotationTrials = 12;

  // ─────────────────────────────────────────────────────────────────────────
  // 1. 정규화
  // ─────────────────────────────────────────────────────────────────────────

  /// [points]를 [0,1]² 공간으로 정규화한다.
  /// 종횡비를 유지하고 중앙 정렬한다.
  static List<List<double>> normalizePoints(List<List<double>> points) {
    if (points.length < 2) return points;

    final minX = points.map((p) => p[0]).reduce(min);
    final maxX = points.map((p) => p[0]).reduce(max);
    final minY = points.map((p) => p[1]).reduce(min);
    final maxY = points.map((p) => p[1]).reduce(max);

    final scale = max(maxX - minX, maxY - minY);
    if (scale == 0) return List.filled(points.length, [0.5, 0.5]);

    // 짧은 축은 중앙 정렬을 위해 오프셋 추가
    final ox = (scale - (maxX - minX)) / 2;
    final oy = (scale - (maxY - minY)) / 2;

    return points
        .map((p) => [
              (p[0] - minX + ox) / scale,
              (p[1] - minY + oy) / scale,
            ])
        .toList();
  }

  // ─────────────────────────────────────────────────────────────────────────
  // 2. 리샘플링
  // ─────────────────────────────────────────────────────────────────────────

  /// [path]를 호 길이 기준으로 [n]개 등간격 점으로 리샘플링한다.
  static List<List<double>> resamplePath(
    List<List<double>> path, [
    int n = _resampleCount,
  ]) {
    if (path.length < 2) {
      final pt = path.isEmpty ? [0.5, 0.5] : path[0];
      return List.filled(n, pt);
    }

    // 누적 호 길이 계산
    final arcLen = <double>[0.0];
    for (int i = 1; i < path.length; i++) {
      final dx = path[i][0] - path[i - 1][0];
      final dy = path[i][1] - path[i - 1][1];
      arcLen.add(arcLen.last + sqrt(dx * dx + dy * dy));
    }
    final total = arcLen.last;
    if (total == 0) return List.filled(n, path[0]);

    final result = <List<double>>[];
    int j = 0;
    for (int i = 0; i < n; i++) {
      final target = total * i / (n - 1);
      while (j < arcLen.length - 2 && arcLen[j + 1] < target) j++;
      final segLen = arcLen[j + 1] - arcLen[j];
      final t = segLen == 0 ? 0.0 : (target - arcLen[j]) / segLen;
      result.add([
        path[j][0] + t * (path[j + 1][0] - path[j][0]),
        path[j][1] + t * (path[j + 1][1] - path[j][1]),
      ]);
    }
    return result;
  }

  // ─────────────────────────────────────────────────────────────────────────
  // 3. DTW
  // ─────────────────────────────────────────────────────────────────────────

  /// 두 경로의 DTW 거리를 계산한다 (O(n²) DP).
  static double _dtw(List<List<double>> a, List<List<double>> b) {
    final n = a.length;
    final m = b.length;
    final dp = List.generate(n, (_) => List<double>.filled(m, double.infinity));

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        final dx = a[i][0] - b[j][0];
        final dy = a[i][1] - b[j][1];
        final d = sqrt(dx * dx + dy * dy);

        final best = (i == 0 && j == 0)
            ? 0.0
            : [
                if (i > 0) dp[i - 1][j],
                if (j > 0) dp[i][j - 1],
                if (i > 0 && j > 0) dp[i - 1][j - 1],
              ].reduce(min);

        dp[i][j] = d + best;
      }
    }
    return dp[n - 1][m - 1];
  }

  // ─────────────────────────────────────────────────────────────────────────
  // 4. 점수 계산
  // ─────────────────────────────────────────────────────────────────────────

  /// [run]과 [target] 경로 간 유사도 점수를 0~100으로 반환한다.
  ///
  /// [target]의 시작점을 [_rotationTrials]방향으로 이동해 최선의 정렬을 찾는다.
  /// (GPS 경로의 시작 위치가 기준 도형 시작점과 다를 수 있기 때문)
  static double computeSimilarityScore(
    List<List<double>> run,
    List<List<double>> target,
  ) {
    final n = target.length;
    final step = n ~/ _rotationTrials;
    var bestDtw = double.infinity;

    for (int r = 0; r < _rotationTrials; r++) {
      final offset = r * step;
      final shifted = [...target.sublist(offset), ...target.sublist(0, offset)];
      final d = _dtw(run, shifted);
      if (d < bestDtw) bestDtw = d;
    }

    // DTW 총합을 점 수로 나눠 평균 거리 산출 후 선형 변환
    final avgDist = bestDtw / n;
    final score = (1.0 - avgDist / _maxAvgDist).clamp(0.0, 1.0) * 100.0;
    return double.parse(score.toStringAsFixed(1));
  }

  // ─────────────────────────────────────────────────────────────────────────
  // 5. 도형별 기준 경로
  // ─────────────────────────────────────────────────────────────────────────

  /// [type]에 해당하는 기준 경로(waypoints)를 반환한다.
  /// custom 타입은 원형으로 폴백.
  static List<List<double>> getReferencePath(ShapeType type) {
    return switch (type) {
      ShapeType.circle => _circle(),
      ShapeType.triangle => _triangle(),
      ShapeType.square => _square(),
      ShapeType.star => _star(),
      ShapeType.heart => _heart(),
      ShapeType.pentagon => _pentagon(),
      ShapeType.custom => _circle(),
    };
  }

  /// 원 (64분할)
  static List<List<double>> _circle() {
    const segments = 64;
    return List.generate(segments + 1, (i) {
      final angle = 2 * pi * i / segments - pi / 2; // 12시 방향 시작
      return [0.5 + 0.45 * cos(angle), 0.5 + 0.45 * sin(angle)];
    });
  }

  /// 정삼각형
  static List<List<double>> _triangle() {
    return [
      [0.50, 0.05], // 꼭대기
      [0.95, 0.92], // 오른쪽 아래
      [0.05, 0.92], // 왼쪽 아래
      [0.50, 0.05], // 닫기
    ];
  }

  /// 정사각형
  static List<List<double>> _square() {
    return [
      [0.05, 0.05],
      [0.95, 0.05],
      [0.95, 0.95],
      [0.05, 0.95],
      [0.05, 0.05], // 닫기
    ];
  }

  /// 5각별 (외반경 0.45, 내반경 0.18)
  static List<List<double>> _star() {
    const cx = 0.5, cy = 0.5;
    const outerR = 0.45, innerR = 0.18;
    const n = 5;
    final pts = <List<double>>[];
    for (int i = 0; i < n; i++) {
      final outerA = -pi / 2 + 2 * pi * i / n;
      final innerA = outerA + pi / n;
      pts.add([cx + outerR * cos(outerA), cy + outerR * sin(outerA)]);
      pts.add([cx + innerR * cos(innerA), cy + innerR * sin(innerA)]);
    }
    pts.add(pts[0]); // 닫기
    return pts;
  }

  /// 하트 (파라메트릭 곡선, 64분할)
  ///
  /// 수식: x = 16·sin³t,  y = 13·cos t − 5·cos 2t − 2·cos 3t − cos 4t
  /// 범위: x ∈ [−16, 16],  y ∈ [−17, 13]
  /// 스크린 좌표 (y 아래 방향): 패딩 5% 포함해 [0.05, 0.95]로 매핑
  static List<List<double>> _heart() {
    const segments = 64;
    return List.generate(segments + 1, (i) {
      final t = 2 * pi * i / segments;
      final x = 16 * pow(sin(t), 3).toDouble();
      final y = 13 * cos(t) -
          5 * cos(2 * t) -
          2 * cos(3 * t) -
          cos(4 * t);
      // x ∈ [-16, 16] → [0.05, 0.95]
      // y 수학 좌표(위=양수)를 스크린(아래=양수)으로 반전: -y 범위 [-13, 17]
      final sx = 0.05 + (x + 16) / 32 * 0.90;
      final sy = 0.05 + (-y + 13) / 30 * 0.90;
      return [sx, sy];
    });
  }

  /// 정오각형
  static List<List<double>> _pentagon() {
    const n = 5;
    return List.generate(n + 1, (i) {
      final angle = -pi / 2 + 2 * pi * i / n; // 12시 방향 시작
      return [0.5 + 0.45 * cos(angle), 0.5 + 0.45 * sin(angle)];
    });
  }
}
