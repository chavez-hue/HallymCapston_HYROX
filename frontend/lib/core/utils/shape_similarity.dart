import 'dart:math';

import 'package:flutter/painting.dart';

import '../../features/running/domain/entities/gps_point.dart';
import '../../features/shape/domain/entities/shape_grade.dart';

/// Number of uniformly-resampled points used for DTW comparison.
const int _kSamplePoints = 100;

/// Number of circular rotation offsets tried during alignment.
const int _kRotationTrials = 16;

// ── Result ─────────────────────────────────────────────────────

class ShapeSimilarityResult {
  /// Similarity score in [0, 100].
  final double score;

  /// 인정 조건(유사도 >= 70, 거리 >= 1km, 페이스 <= 10분/km) 모두 충족 시 true.
  final bool isPassed;

  /// 인정 시 거리 기반 등급. 미인정이면 null.
  final ShapeGrade? grade;

  /// GPS path normalised to [0, 1]² and resampled to _kSamplePoints.
  final List<Offset> normalizedRoute;

  /// Target shape template in [0, 1]².
  final List<Offset> templatePath;

  const ShapeSimilarityResult({
    required this.score,
    required this.isPassed,
    this.grade,
    required this.normalizedRoute,
    required this.templatePath,
  });
}

// ── Calculator ─────────────────────────────────────────────────

class ShapeSimilarityCalculator {
  ShapeSimilarityCalculator._();

  /// Returns the template point list for a Korean shape name.
  static List<Offset> templateFor(String shapeName) {
    switch (shapeName) {
      case '원':
        return ShapeTemplates.circle(_kSamplePoints);
      case '삼각형':
        return ShapeTemplates.triangle(_kSamplePoints);
      case '사각형':
        return ShapeTemplates.square(_kSamplePoints);
      case '별':
        return ShapeTemplates.star(_kSamplePoints);
      case '하트':
        return ShapeTemplates.heart(_kSamplePoints);
      case '오각형':
        return ShapeTemplates.pentagon(_kSamplePoints);
      default:
        return ShapeTemplates.circle(_kSamplePoints);
    }
  }

  /// Full pipeline: GPS route + shape name → similarity result.
  ///
  /// The algorithm:
  /// 1. Normalise GPS lat/lon to [0, 1]² (aspect-ratio-preserving).
  /// 2. Resample both paths to [_kSamplePoints] equidistant points.
  /// 3. Try [_kRotationTrials] circular starting offsets × 2 directions
  ///    and take the minimum DTW distance (handles arbitrary start point
  ///    and CW/CCW orientation).
  /// 4. Convert average per-point DTW distance to a 0–100 score.
  ///
  /// 인정 조건 3가지:
  ///   1. [distanceKm] >= 1.0 km
  ///   2. [avgPace] <= 10분/km (600초), 포맷 "MM'SS\""
  ///   3. 유사도 점수 >= 70
  static ShapeSimilarityResult analyze(
    List<GpsPoint> route,
    String shapeName, {
    double distanceKm = 0.0,
    String avgPace = '',
  }) {
    final template = templateFor(shapeName);

    if (route.length < 3) {
      return ShapeSimilarityResult(
        score: 0,
        isPassed: false,
        grade: null,
        normalizedRoute: const [],
        templatePath: template,
      );
    }

    final normalized = normalizeRoute(route);
    final resampled = resample(normalized, _kSamplePoints);

    double bestDtw = double.infinity;

    for (int trial = 0; trial < _kRotationTrials; trial++) {
      final offset = trial * (_kSamplePoints ~/ _kRotationTrials);

      final forward = _rotate(resampled, offset);
      final dForward = _dtw(forward, template);
      if (dForward < bestDtw) bestDtw = dForward;

      final backward = forward.reversed.toList();
      final dBackward = _dtw(backward, template);
      if (dBackward < bestDtw) bestDtw = dBackward;
    }

    // Average per-point displacement in [0,1]² space.
    // At 0.15 avg → score 70 (pass threshold).
    final score = (100 - (bestDtw / _kSamplePoints) * 200).clamp(0.0, 100.0);

    final grade = ShapeGradeX.check(
      distanceKm: distanceKm,
      avgPaceStr: avgPace,
      similarityScore: score,
    );

    return ShapeSimilarityResult(
      score: score,
      isPassed: grade != null,
      grade: grade,
      normalizedRoute: resampled,
      templatePath: template,
    );
  }

  /// Converts GPS lat/lon list to normalised [0, 1]² Offsets.
  /// Preserves aspect ratio; fits the longest axis to [0.1, 0.9].
  static List<Offset> normalizeRoute(List<GpsPoint> route) {
    if (route.isEmpty) return const [];

    double minLat = route[0].latitude, maxLat = route[0].latitude;
    double minLon = route[0].longitude, maxLon = route[0].longitude;

    for (final p in route) {
      if (p.latitude < minLat) minLat = p.latitude;
      if (p.latitude > maxLat) maxLat = p.latitude;
      if (p.longitude < minLon) minLon = p.longitude;
      if (p.longitude > maxLon) maxLon = p.longitude;
    }

    final spanLat = maxLat - minLat;
    final spanLon = maxLon - minLon;

    if (spanLat < 1e-9 && spanLon < 1e-9) {
      return route.map((_) => const Offset(0.5, 0.5)).toList();
    }

    final span = max(spanLat, spanLon);
    final scale = 0.8 / span;
    final dx = 0.5 - (spanLon * scale) / 2;
    final dy = 0.5 - (spanLat * scale) / 2;

    return route
        .map((p) => Offset(
              dx + (p.longitude - minLon) * scale,
              dy + (maxLat - p.latitude) * scale, // north = low y (screen)
            ))
        .toList();
  }

  /// Resamples [path] to exactly [n] equidistant points by arc-length.
  static List<Offset> resample(List<Offset> path, int n) {
    if (path.isEmpty) return List.filled(n, Offset.zero);
    if (path.length == 1) return List.filled(n, path[0]);

    // Build cumulative arc-length table.
    final cumDist = <double>[0.0];
    for (int i = 1; i < path.length; i++) {
      cumDist.add(cumDist.last + (path[i] - path[i - 1]).distance);
    }
    final total = cumDist.last;
    if (total < 1e-12) return List.filled(n, path[0]);

    final step = total / (n - 1);
    final result = <Offset>[path[0]];
    int j = 0;

    for (int i = 1; i < n - 1; i++) {
      final target = i * step;
      while (j < cumDist.length - 2 && cumDist[j + 1] < target) {
        j++;
      }
      final span = cumDist[j + 1] - cumDist[j];
      final t = span < 1e-12 ? 0.0 : (target - cumDist[j]) / span;
      result.add(Offset.lerp(path[j], path[j + 1], t)!);
    }
    result.add(path.last);
    return result;
  }

  // ── Private helpers ──────────────────────────────────────────

  static List<Offset> _rotate(List<Offset> path, int offset) {
    if (offset == 0 || path.isEmpty) return path;
    final n = path.length;
    final off = offset % n;
    if (off == 0) return path;
    return [...path.sublist(off), ...path.sublist(0, off)];
  }

  /// O(n²) space-optimised DTW between two equal-length paths.
  static double _dtw(List<Offset> a, List<Offset> b) {
    final n = a.length;
    final m = b.length;

    var prev = List<double>.filled(m, double.infinity);
    var curr = List<double>.filled(m, 0.0);

    // First row
    prev[0] = _euclidean(a[0], b[0]);
    for (int j = 1; j < m; j++) {
      prev[j] = prev[j - 1] + _euclidean(a[0], b[j]);
    }

    for (int i = 1; i < n; i++) {
      curr[0] = prev[0] + _euclidean(a[i], b[0]);
      for (int j = 1; j < m; j++) {
        final minPrev = prev[j] < prev[j - 1]
            ? (prev[j] < curr[j - 1] ? prev[j] : curr[j - 1])
            : (prev[j - 1] < curr[j - 1] ? prev[j - 1] : curr[j - 1]);
        curr[j] = _euclidean(a[i], b[j]) + minPrev;
      }
      // Swap rows without allocation.
      final tmp = prev;
      prev = curr;
      curr = tmp;
    }

    return prev[m - 1];
  }

  static double _euclidean(Offset a, Offset b) {
    final dx = a.dx - b.dx;
    final dy = a.dy - b.dy;
    return sqrt(dx * dx + dy * dy);
  }
}

// ── Shape Templates ────────────────────────────────────────────

/// Generates normalised [0, 1]² point lists for each shape type.
/// Templates fit within [0.1, 0.9] (radius = 0.4, centre = 0.5).
class ShapeTemplates {
  ShapeTemplates._();

  static const double _cx = 0.5;
  static const double _cy = 0.5;
  static const double _r = 0.4;

  static List<Offset> circle(int n) => List.generate(n, (i) {
        final t = 2 * pi * i / n;
        return Offset(_cx + _r * cos(t), _cy + _r * sin(t));
      });

  static List<Offset> triangle(int n) =>
      _samplePolygon(_regularVerts(3, -pi / 2), n);

  static List<Offset> square(int n) =>
      _samplePolygon(_regularVerts(4, -pi / 4), n);

  static List<Offset> pentagon(int n) =>
      _samplePolygon(_regularVerts(5, -pi / 2), n);

  static List<Offset> star(int n) {
    const innerR = _r * 0.38;
    final verts = List.generate(10, (i) {
      final a = -pi / 2 + i * pi / 5;
      final r = i.isEven ? _r : innerR;
      return Offset(_cx + r * cos(a), _cy + r * sin(a));
    });
    return _samplePolygon(verts, n);
  }

  /// Uses the standard parametric heart curve:
  ///   x(t) = 16 sin³(t)
  ///   y(t) = -(13cos(t) − 5cos(2t) − 2cos(3t) − cos(4t))
  /// Normalised to fit [0.1, 0.9] preserving aspect ratio.
  static List<Offset> heart(int n) {
    final raw = List.generate(n, (i) {
      final t = 2 * pi * i / n;
      final x = 16 * pow(sin(t), 3).toDouble();
      final y =
          -(13 * cos(t) - 5 * cos(2 * t) - 2 * cos(3 * t) - cos(4 * t));
      return Offset(x, y);
    });

    double minX = raw[0].dx, maxX = raw[0].dx;
    double minY = raw[0].dy, maxY = raw[0].dy;
    for (final p in raw) {
      if (p.dx < minX) minX = p.dx;
      if (p.dx > maxX) maxX = p.dx;
      if (p.dy < minY) minY = p.dy;
      if (p.dy > maxY) maxY = p.dy;
    }

    final spanX = maxX - minX;
    final spanY = maxY - minY;
    final scale = 2 * _r / max(spanX, spanY);
    final ox = _cx - (spanX * scale) / 2;
    final oy = _cy - (spanY * scale) / 2;

    return raw
        .map((p) => Offset(
              ox + (p.dx - minX) * scale,
              oy + (p.dy - minY) * scale,
            ))
        .toList();
  }

  // ── Private helpers ──────────────────────────────────────────

  static List<Offset> _regularVerts(int sides, double startAngle) =>
      List.generate(sides, (i) {
        final a = startAngle + 2 * pi * i / sides;
        return Offset(_cx + _r * cos(a), _cy + _r * sin(a));
      });

  /// Samples [n] equidistant points along the perimeter of [verts].
  static List<Offset> _samplePolygon(List<Offset> verts, int n) {
    final len = verts.length;
    final cumDist = <double>[0.0];
    for (int i = 0; i < len; i++) {
      final a = verts[i];
      final b = verts[(i + 1) % len];
      cumDist.add(cumDist.last + (b - a).distance);
    }
    final perimeter = cumDist.last;
    if (perimeter < 1e-12) return List.filled(n, verts[0]);

    final result = <Offset>[];
    for (int p = 0; p < n; p++) {
      final target = perimeter * p / n;
      int e = 0;
      while (e < len - 1 && cumDist[e + 1] <= target) {
        e++;
      }
      final span = cumDist[e + 1] - cumDist[e];
      final t = span < 1e-12 ? 0.0 : (target - cumDist[e]) / span;
      final va = verts[e];
      final vb = verts[(e + 1) % len];
      result.add(
        Offset(va.dx + t * (vb.dx - va.dx), va.dy + t * (vb.dy - va.dy)),
      );
    }
    return result;
  }
}
