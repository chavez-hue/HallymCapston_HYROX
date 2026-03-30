import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/common/app_button.dart';
import '../main/main_navigation_screen.dart';

class RunPauseScreen extends StatelessWidget {
  const RunPauseScreen({super.key});

  void _handleContinue(BuildContext context) {
    // TODO: 러닝 재시작 기능 연결
    Navigator.pop(context);
  }

  void _handleFinish(BuildContext context) {
    // TODO: 러닝 종료 및 기록 저장 기능 연결
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const MainNavigationScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Paused',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Take a short break and continue when you are ready.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 28),

                AppButton(
                  text: 'Continue',
                  backgroundColor: AppColors.neonGreen,
                  foregroundColor: AppColors.black,
                  onPressed: () => _handleContinue(context),
                ),

                const SizedBox(height: 12),

                AppButton(
                  text: 'Finish',
                  backgroundColor: AppColors.primaryOrange,
                  foregroundColor: AppColors.white,
                  onPressed: () => _handleFinish(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}