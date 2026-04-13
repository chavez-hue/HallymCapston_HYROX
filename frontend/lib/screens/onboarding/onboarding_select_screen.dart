import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_colors.dart';

class OnboardingSelectScreen extends StatelessWidget {
  const OnboardingSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // RRP 로고
              const Text(
                'RRP',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: AppColors.primaryOrange,
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(height: 6),

              // 서브타이틀
              const Text(
                'Running Route Puzzle',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.8,
                ),
              ),

              const SizedBox(height: 24),

              // 이미지
              SizedBox(
                height: screenHeight * 0.6,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/앱 사진.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),

              const Spacer(),

              // Join us 버튼
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => context.go('/signup'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryOrange,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Join us',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Log in 버튼
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () => context.go('/login'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.white,
                    side: const BorderSide(color: AppColors.white, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}
