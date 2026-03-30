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
  final EdgeInsetsGeometry padding;

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
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  factory AppButton.outline({
    required String text,
    required VoidCallback? onPressed,
    double height = 56,
    double borderRadius = 28,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return AppButton(
      text: text,
      onPressed: onPressed,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      height: height,
      borderRadius: borderRadius,
      fontSize: fontSize,
      fontWeight: fontWeight,
      side: const BorderSide(
        color: AppColors.black,
        width: 1.2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;

    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isDisabled ? Colors.grey.shade300 : backgroundColor,
          foregroundColor:
              isDisabled ? Colors.grey.shade600 : foregroundColor,
          disabledBackgroundColor: Colors.grey.shade300,
          disabledForegroundColor: Colors.grey.shade600,
          elevation: 0,
          shadowColor: Colors.transparent,
          side: side,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}