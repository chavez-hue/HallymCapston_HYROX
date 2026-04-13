import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';

/// Displays the target shape outline and the user's GPS-traced path overlay.
class ShapeCanvas extends StatelessWidget {
  const ShapeCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
      ),
      child: CustomPaint(
        painter: _ShapePainter(),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: draw target shape vertices and user run path
    final paint = Paint()
      ..color = AppColors.neonGreen.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // placeholder: draw a simple square outline
    final rect = Rect.fromLTWH(
      size.width * 0.2,
      size.height * 0.2,
      size.width * 0.6,
      size.height * 0.6,
    );
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
