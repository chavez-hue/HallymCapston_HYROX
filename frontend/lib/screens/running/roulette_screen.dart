import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_colors.dart';

// ── Constants ──────────────────────────────────────────────────

const int _kRepeats = 25;
const double _kItemExtent = 120.0;

// ── Shape model ────────────────────────────────────────────────

enum _ShapeType { circle, triangle, square, star, heart, pentagon }

class _Shape {
  final String name;
  final _ShapeType type;
  const _Shape(this.name, this.type);
}

const List<_Shape> _kShapes = [
  _Shape('원', _ShapeType.circle),
  _Shape('삼각형', _ShapeType.triangle),
  _Shape('사각형', _ShapeType.square),
  _Shape('별', _ShapeType.star),
  _Shape('하트', _ShapeType.heart),
  _Shape('오각형', _ShapeType.pentagon),
];

// 한국어 조사 선택 (을/를)
String _eul(String word) {
  final code = word.codeUnitAt(word.length - 1);
  if (code < 0xAC00 || code > 0xD7A3) return '을(를)';
  return ((code - 0xAC00) % 28 != 0) ? '을' : '를';
}

// ── Screen ─────────────────────────────────────────────────────

class RouletteScreen extends StatefulWidget {
  const RouletteScreen({super.key});

  @override
  State<RouletteScreen> createState() => _RouletteScreenState();
}

class _RouletteScreenState extends State<RouletteScreen> {
  late final FixedExtentScrollController _ctrl;
  bool _isSpinning = false;
  _Shape? _result;

  @override
  void initState() {
    super.initState();
    _ctrl = FixedExtentScrollController(
      initialItem: _kShapes.length * (_kRepeats ~/ 2),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _spin() async {
    if (_isSpinning || _result != null) return;

    final rng = Random();
    final targetIndex = rng.nextInt(_kShapes.length);
    // Land deep in the list so there are many full rotations
    final targetItem = _kShapes.length * (_kRepeats - 3) + targetIndex;

    setState(() => _isSpinning = true);

    await _ctrl.animateToItem(
      targetItem,
      duration: const Duration(milliseconds: 3500),
      curve: Curves.decelerate, // starts fast, ends slow
    );

    if (!mounted) return;
    setState(() {
      _isSpinning = false;
      _result = _kShapes[targetIndex];
    });

    // Navigate after 2 s (matches the countdown display)
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.go('/run', extra: {
        'mode': 'random',
        'shapeLabel': _kShapes[targetIndex].name,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasResult = _result != null;

    return PopScope(
      canPop: !_isSpinning,
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: hasResult
            ? null
            : AppBar(
                backgroundColor: AppColors.black,
                foregroundColor: AppColors.white,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _isSpinning ? null : () => context.pop(),
                ),
                title: const Text(
                  'RANDOM',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: AppColors.white,
                  ),
                ),
              ),
        body: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, anim) => FadeTransition(
              opacity: anim,
              child: ScaleTransition(
                scale: Tween(begin: 0.88, end: 1.0).animate(
                  CurvedAnimation(parent: anim, curve: Curves.easeOutBack),
                ),
                child: child,
              ),
            ),
            child: hasResult
                ? _ResultView(
                    key: const ValueKey('result'),
                    shape: _result!,
                  )
                : _DrumView(
                    key: const ValueKey('drum'),
                    ctrl: _ctrl,
                    isSpinning: _isSpinning,
                    onSpin: _spin,
                  ),
          ),
        ),
      ),
    );
  }
}

// ── Drum View ──────────────────────────────────────────────────

class _DrumView extends StatelessWidget {
  final FixedExtentScrollController ctrl;
  final bool isSpinning;
  final VoidCallback onSpin;

  const _DrumView({
    super.key,
    required this.ctrl,
    required this.isSpinning,
    required this.onSpin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          isSpinning ? '도형 선택 중...' : '룰렛을 돌려 도형을 뽑아보세요',
          style: const TextStyle(fontSize: 15, color: AppColors.textSecondary),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        // ── Drum wheel ──
        SizedBox(
          height: _kItemExtent * 3,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ListWheelScrollView.useDelegate(
                controller: ctrl,
                physics: const NeverScrollableScrollPhysics(),
                itemExtent: _kItemExtent,
                diameterRatio: 2.5,
                overAndUnderCenterOpacity: 0.25,
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: _kShapes.length * _kRepeats,
                  builder: (_, i) =>
                      _DrumItem(shape: _kShapes[i % _kShapes.length]),
                ),
              ),
              // Top fade-out gradient
              Positioned(
                top: 0, left: 0, right: 0,
                child: IgnorePointer(
                  child: Container(
                    height: _kItemExtent,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.black, Colors.transparent],
                      ),
                    ),
                  ),
                ),
              ),
              // Bottom fade-out gradient
              Positioned(
                bottom: 0, left: 0, right: 0,
                child: IgnorePointer(
                  child: Container(
                    height: _kItemExtent,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [AppColors.black, Colors.transparent],
                      ),
                    ),
                  ),
                ),
              ),
              // Orange selection bracket
              Positioned(
                left: 24, right: 24,
                child: IgnorePointer(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(height: 2.5, color: AppColors.primaryOrange),
                      const SizedBox(height: _kItemExtent - 5),
                      Container(height: 2.5, color: AppColors.primaryOrange),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        // ── Spin button ──
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: isSpinning ? null : onSpin,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryOrange,
                disabledBackgroundColor: AppColors.surface,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                isSpinning ? '선택 중...' : '룰렛 돌리기',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color:
                      isSpinning ? AppColors.textSecondary : AppColors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class _DrumItem extends StatelessWidget {
  final _Shape shape;
  const _DrumItem({super.key, required this.shape});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _kItemExtent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 38,
            height: 38,
            child: CustomPaint(
              painter: ShapePainter(
                type: shape.type,
                color: AppColors.white,
                strokeWidth: 2.5,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            shape.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Result View ────────────────────────────────────────────────

class _ResultView extends StatefulWidget {
  final _Shape shape;
  const _ResultView({super.key, required this.shape});

  @override
  State<_ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<_ResultView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _scale = Tween(begin: 0.96, end: 1.04).animate(
      CurvedAnimation(parent: _pulse, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final label = '${widget.shape.name}${_eul(widget.shape.name)} 그리며 달려요!';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '선택된 도형',
          style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 28),
        // Pulsing icon card
        ScaleTransition(
          scale: _scale,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(36),
              border: Border.all(color: AppColors.primaryOrange, width: 3),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryOrange.withValues(alpha: 0.4),
                  blurRadius: 36,
                  spreadRadius: 6,
                ),
              ],
            ),
            child: Center(
              child: CustomPaint(
                size: const Size(100, 100),
                painter: ShapePainter(
                  type: widget.shape.type,
                  color: AppColors.primaryOrange,
                  strokeWidth: 6,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Text(
          widget.shape.name,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            color: AppColors.white,
            letterSpacing: 4,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 36),
        const _Countdown(),
      ],
    );
  }
}

class _Countdown extends StatefulWidget {
  const _Countdown();

  @override
  State<_Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<_Countdown> {
  int _secs = 2;

  @override
  void initState() {
    super.initState();
    _tick();
  }

  Future<void> _tick() async {
    while (_secs > 0 && mounted) {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) setState(() => _secs--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_secs초 후 러닝 시작...',
      style: const TextStyle(fontSize: 14, color: AppColors.gray),
    );
  }
}

// ── Shape Painter ──────────────────────────────────────────────
// Public so it can be reused elsewhere (e.g. history cards, running page).

class ShapePainter extends CustomPainter {
  final _ShapeType type;
  final Color color;
  final double strokeWidth;

  const ShapePainter({
    required this.type,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.shortestSide / 2 - strokeWidth;

    switch (type) {
      case _ShapeType.circle:
        canvas.drawCircle(Offset(cx, cy), r, paint);
      case _ShapeType.triangle:
        _polygon(canvas, paint, cx, cy, r, 3, -pi / 2);
      case _ShapeType.square:
        _polygon(canvas, paint, cx, cy, r, 4, -pi / 4);
      case _ShapeType.star:
        _star(canvas, paint, cx, cy, r);
      case _ShapeType.heart:
        _heart(canvas, paint, cx, cy, r);
      case _ShapeType.pentagon:
        _polygon(canvas, paint, cx, cy, r, 5, -pi / 2);
    }
  }

  void _polygon(Canvas canvas, Paint paint, double cx, double cy, double r,
      int n, double startAngle) {
    final path = Path();
    for (int i = 0; i < n; i++) {
      final a = startAngle + i * 2 * pi / n;
      final pt = Offset(cx + r * cos(a), cy + r * sin(a));
      i == 0 ? path.moveTo(pt.dx, pt.dy) : path.lineTo(pt.dx, pt.dy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  void _star(Canvas canvas, Paint paint, double cx, double cy, double r) {
    final inner = r * 0.38;
    final path = Path();
    for (int i = 0; i < 10; i++) {
      final a = -pi / 2 + i * pi / 5;
      final rad = i.isEven ? r : inner;
      final pt = Offset(cx + rad * cos(a), cy + rad * sin(a));
      i == 0 ? path.moveTo(pt.dx, pt.dy) : path.lineTo(pt.dx, pt.dy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  void _heart(Canvas canvas, Paint paint, double cx, double cy, double r) {
    final s = r * 0.9;
    final path = Path()
      // bottom tip
      ..moveTo(cx, cy + s)
      // left lower → left bump
      ..cubicTo(cx - s * 0.65, cy + s * 0.55, cx - s * 1.3, cy, cx - s, cy - s * 0.35)
      // left bump → center dip
      ..cubicTo(cx - s * 0.8, cy - s * 0.85, cx - s * 0.1, cy - s * 0.8, cx, cy - s * 0.35)
      // center dip → right bump
      ..cubicTo(cx + s * 0.1, cy - s * 0.8, cx + s * 0.8, cy - s * 0.85, cx + s, cy - s * 0.35)
      // right bump → bottom tip
      ..cubicTo(cx + s * 1.3, cy, cx + s * 0.65, cy + s * 0.55, cx, cy + s)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ShapePainter old) =>
      old.type != type ||
      old.color != color ||
      old.strokeWidth != strokeWidth;
}
