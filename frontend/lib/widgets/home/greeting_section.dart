import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Hello, Runner!',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
    );
  }
}