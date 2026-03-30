import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double height;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final BorderSide? side;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryOrange,
    this.foregroundColor = AppColors.white,
    this.height = 56,
    this.borderRadius = 28,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w700,
    this.side,
  });

  /// 🔥 추가: OUTLINE 버튼
  factory AppButton.outline({
    required String text,
    required VoidCallback? onPressed,
  }) {
    return AppButton(
      text: text,
      onPressed: onPressed,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      side: const BorderSide(color: AppColors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 0,
          side: side,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}