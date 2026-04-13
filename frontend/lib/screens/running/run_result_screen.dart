import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_colors.dart';
import '../../core/utils/shape_similarity.dart';
import '../../features/running/domain/entities/run_record.dart';
import '../../features/shape/domain/entities/shape_grade.dart';

// ── Screen ─────────────────────────────────────────────────────

class RunResultScreen extends StatefulWidget {
  final RunRecord record;
  final String mode; // 'random' | 'custom'
  final String? shapeLabel;

  const RunResultScreen({
    super.key,
    required this.record,
    required this.mode,
    this.shapeLabel,
  });

  @override
  State<RunResultScreen> createState() => _RunResultScreenState();
}

class _RunResultScreenState extends State<RunResultScreen>
    with SingleTickerProviderStateMixin {
  late final ShapeSimilarityResult? _analysis;
  late final List<_Point> _displayRoute;
  late final AnimationController _scoreAnim;
  late final Animation<double> _scoreValue;

  @override
  void initState() {
    super.initState();

    if (widget.mode == 'random' && widget.shapeLabel != null) {
      _analysis = ShapeSimilarityCalculator.analyze(
        widget.record.route,
        widget.shapeLabel!,
        distanceKm: widget.record.distanceKm,
        avgPace: widget.record.avgPace,
      );
      _displayRoute = _analysis!.normalizedRoute
          .map((o) => _Point(o.dx, o.dy))
          .toList();
    } else {
      _analysis = null;
      // Custom mode: normalise and resample route for display only.
      final norm = ShapeSimilarityCalculator.normalizeRoute(widget.record.route);
      final resampled = norm.isNotEmpty
          ? ShapeSimilarityCalculator.resample(norm, 200)
          : <Offset>[];
      _displayRoute = resampled.map((o) => _Point(o.dx, o.dy)).toList();
    }

    // Animate score from 0 → actual.
    final targetScore = _analysis?.score ?? 0;
    _scoreAnim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _scoreValue = Tween<double>(begin: 0, end: targetScore).animate(
      CurvedAnimation(parent: _scoreAnim, curve: Curves.easeOutCubic),
    );
    _scoreAnim.forward();
  }

  @override
  void dispose() {
    _scoreAnim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final record = widget.record;
    final isRandom = widget.mode == 'random';

    final h = record.duration.inHours;
    final m = record.duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = record.duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    final timeLabel = h > 0 ? '$h:$m:$s' : '$m:$s';

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          backgroundColor: AppColors.black,
          foregroundColor: AppColors.white,
          automaticallyImplyLeading: false,
          title: const Text(
            'RUN COMPLETE',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: AppColors.primaryOrange,
              letterSpacing: 2,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => context.go('/home'),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Canvas ──────────────────────────────────────
                AspectRatio(
                  aspectRatio: 1,
                  child: _RouteCanvas(
                    routePoints: _displayRoute,
                    templatePoints: isRandom
                        ? (_analysis?.templatePath
                                .map((o) => _Point(o.dx, o.dy))
                                .toList() ??
                            [])
                        : [],
                    isRandom: isRandom,
                  ),
                ),

                const SizedBox(height: 24),

                if (isRandom) ...[
                  // ── Score section ─────────────────────────────
                  _ScoreSection(
                    scoreAnim: _scoreValue,
                    analysis: _analysis!,
                  ),
                ] else ...[
                  // ── Custom mode label ─────────────────────────
                  if (widget.shapeLabel != null && widget.shapeLabel!.isNotEmpty)
                    Center(
                      child: Text(
                        widget.shapeLabel!,
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          color: AppColors.neonGreen,
                          letterSpacing: 4,
                        ),
                      ),
                    ),
                  const SizedBox(height: 4),
                  const Center(
                    child: Text(
                      'MY ROUTE',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 24),
                const Divider(color: AppColors.surface, thickness: 1.5),
                const SizedBox(height: 20),

                // ── Stats ────────────────────────────────────────
                _StatRow(
                  label: '거리',
                  value: '${record.distanceKm.toStringAsFixed(2)} km',
                ),
                const SizedBox(height: 14),
                _StatRow(label: '시간', value: timeLabel),
                const SizedBox(height: 14),
                _StatRow(label: '평균 페이스', value: record.avgPace),

                const SizedBox(height: 36),

                // ── Buttons ──────────────────────────────────────
                if (isRandom) ...[
                  _OrangeButton(
                    label: '홈으로',
                    onTap: () => context.go('/home'),
                  ),
                ] else ...[
                  Row(
                    children: [
                      Expanded(
                        child: _OutlineButton(
                          label: '피드 공유',
                          onTap: () {
                            // TODO: navigate to feed with record
                            context.go('/home');
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _OrangeButton(
                          label: '홈으로',
                          onTap: () => context.go('/home'),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Score Section ───────────────────────────────────────────────

class _ScoreSection extends StatelessWidget {
  final Animation<double> scoreAnim;
  final ShapeSimilarityResult analysis;

  const _ScoreSection({
    required this.scoreAnim,
    required this.analysis,
  });

  Color _gradeColor(ShapeGrade grade) => switch (grade) {
        ShapeGrade.bronze => AppColors.gradeBronze,
        ShapeGrade.silver => AppColors.gradeSilver,
        ShapeGrade.gold => AppColors.gradeGold,
      };

  @override
  Widget build(BuildContext context) {
    final isPassed = analysis.isPassed;
    final grade = analysis.grade;
    final badgeColor = grade != null
        ? _gradeColor(grade)
        : AppColors.primaryOrange;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '도형 유사도',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  AnimatedBuilder(
                    animation: scoreAnim,
                    builder: (_, __) => Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          scoreAnim.value.toInt().toString(),
                          style: const TextStyle(
                            fontSize: 72,
                            fontWeight: FontWeight.w900,
                            color: AppColors.white,
                            height: 1,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '점',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Pass/fail + grade badge
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18, vertical: 10),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    isPassed ? (grade?.label ?? '인정!') : '미인정',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: isPassed ? AppColors.black : AppColors.white,
                    ),
                  ),
                ),
                if (isPassed && grade != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    '인정 완료',
                    style: TextStyle(
                      fontSize: 11,
                      color: badgeColor.withValues(alpha: 0.8),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Progress bar
        AnimatedBuilder(
          animation: scoreAnim,
          builder: (_, __) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: scoreAnim.value / 100,
                minHeight: 8,
                backgroundColor: AppColors.surface,
                valueColor: AlwaysStoppedAnimation<Color>(
                  scoreAnim.value >= 70
                      ? AppColors.neonGreen
                      : AppColors.primaryOrange,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 10),
        // 인정 조건 3가지 표시
        _ConditionRow(
          label: '유사도 70점 이상',
          met: analysis.score >= 70,
        ),
        const SizedBox(height: 4),
        _ConditionRow(
          label: '거리 1km 이상',
          met: isPassed || analysis.score < 70
              ? isPassed
              : false, // 유사도 미달이면 거리 조건 표시만
          // 실제 조건 충족은 grade로 판단 — 단순 표시용으로 score >= 70일 때만 체크
          // grade != null이면 모든 조건 충족, grade == null & score>=70이면 거리/페이스 미달
          overrideMet: _resolveCondition(
            isPassed: isPassed,
            score: analysis.score,
            conditionIndex: 1,
            grade: grade,
          ),
        ),
        const SizedBox(height: 4),
        _ConditionRow(
          label: '평균 페이스 10분/km 이하',
          overrideMet: _resolveCondition(
            isPassed: isPassed,
            score: analysis.score,
            conditionIndex: 2,
            grade: grade,
          ),
        ),
      ],
    );
  }

  /// grade != null → 모든 조건 충족(true).
  /// grade == null & score < 70 → 유사도 미달이므로 나머지 조건 표시 안 함(null).
  /// grade == null & score >= 70 → 거리/페이스 중 미달 조건 있음(false).
  bool? _resolveCondition({
    required bool isPassed,
    required double score,
    required int conditionIndex, // 1=거리, 2=페이스
    required ShapeGrade? grade,
  }) {
    if (grade != null) return true;
    if (score < 70) return null; // 유사도 미달이면 나머지 조건 회색 처리
    return false; // 유사도는 통과했지만 거리/페이스 미달
  }
}

class _ConditionRow extends StatelessWidget {
  final String label;
  final bool? met; // true=충족, false=미충족, null=해당없음(회색)
  final bool? overrideMet;

  const _ConditionRow({
    required this.label,
    this.met,
    this.overrideMet,
  });

  @override
  Widget build(BuildContext context) {
    final effective = overrideMet ?? met;
    final Color iconColor;
    final IconData icon;
    if (effective == true) {
      iconColor = AppColors.neonGreen;
      icon = Icons.check_circle_outline;
    } else if (effective == false) {
      iconColor = AppColors.primaryOrange;
      icon = Icons.cancel_outlined;
    } else {
      iconColor = AppColors.textSecondary;
      icon = Icons.radio_button_unchecked;
    }

    return Row(
      children: [
        Icon(icon, size: 14, color: iconColor),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: effective == null
                ? AppColors.textSecondary
                : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

// ── Canvas ──────────────────────────────────────────────────────

/// Simple wrapper type so this file doesn't depend on dart:ui Offset directly.
class _Point {
  final double x, y;
  const _Point(this.x, this.y);
}

class _RouteCanvas extends StatelessWidget {
  final List<_Point> routePoints;
  final List<_Point> templatePoints;
  final bool isRandom;

  const _RouteCanvas({
    required this.routePoints,
    required this.templatePoints,
    required this.isRandom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: CustomPaint(
          painter: _RoutePainter(
            routePoints: routePoints,
            templatePoints: templatePoints,
            showTemplate: isRandom,
          ),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}

class _RoutePainter extends CustomPainter {
  final List<_Point> routePoints;
  final List<_Point> templatePoints;
  final bool showTemplate;

  const _RoutePainter({
    required this.routePoints,
    required this.templatePoints,
    required this.showTemplate,
  });

  static const double _padding = 28;

  @override
  void paint(Canvas canvas, Size size) {
    if (showTemplate && templatePoints.isNotEmpty) {
      _drawPath(
        canvas,
        templatePoints,
        size,
        Paint()
          ..color = AppColors.neonGreen.withValues(alpha: 0.35)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round,
        closed: true,
      );
    }

    if (routePoints.isNotEmpty) {
      // Draw route with gradient-like effect: start in orange, end brighter.
      _drawPath(
        canvas,
        routePoints,
        size,
        Paint()
          ..color = AppColors.primaryOrange
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round,
      );

      // Start dot (white)
      final startPt = _toCanvas(routePoints.first, size);
      canvas.drawCircle(
        startPt,
        5,
        Paint()..color = AppColors.white,
      );

      // End dot (orange, larger)
      final endPt = _toCanvas(routePoints.last, size);
      canvas.drawCircle(
        endPt,
        6,
        Paint()..color = AppColors.primaryOrange,
      );
      canvas.drawCircle(
        endPt,
        6,
        Paint()
          ..color = AppColors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );
    }

    // Empty state label
    if (routePoints.isEmpty) {
      const textStyle = TextStyle(color: AppColors.textSecondary, fontSize: 14);
      final span = TextSpan(text: 'GPS 경로 없음', style: textStyle);
      final tp = TextPainter(text: span, textDirection: TextDirection.ltr)
        ..layout();
      tp.paint(
        canvas,
        Offset(size.width / 2 - tp.width / 2, size.height / 2 - tp.height / 2),
      );
    }
  }

  void _drawPath(
    Canvas canvas,
    List<_Point> points,
    Size size,
    Paint paint, {
    bool closed = false,
  }) {
    if (points.isEmpty) return;
    final path = Path();
    final first = _toCanvas(points.first, size);
    path.moveTo(first.dx, first.dy);
    for (int i = 1; i < points.length; i++) {
      final p = _toCanvas(points[i], size);
      path.lineTo(p.dx, p.dy);
    }
    if (closed) path.close();
    canvas.drawPath(path, paint);
  }

  Offset _toCanvas(_Point p, Size size) => Offset(
        _padding + p.x * (size.width - 2 * _padding),
        _padding + p.y * (size.height - 2 * _padding),
      );

  @override
  bool shouldRepaint(_RoutePainter old) =>
      old.routePoints != routePoints ||
      old.templatePoints != templatePoints ||
      old.showTemplate != showTemplate;
}

// ── Shared widgets ──────────────────────────────────────────────

class _StatRow extends StatelessWidget {
  final String label;
  final String value;

  const _StatRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 15, color: AppColors.textSecondary),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

class _OrangeButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _OrangeButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _OutlineButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.neonGreen,
          side: const BorderSide(color: AppColors.neonGreen, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
