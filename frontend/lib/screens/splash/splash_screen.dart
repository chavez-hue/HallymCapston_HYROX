import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 네이티브 스플래시 해제 후 1.5초 대기 → 라우팅
    FlutterNativeSplash.remove();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (!mounted) return;
      final isLoggedIn = fb.FirebaseAuth.instance.currentUser != null;
      context.go(isLoggedIn ? '/home' : '/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Text(
          'RRP',
          style: TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.w900,
            color: AppColors.primaryOrange,
            letterSpacing: 8,
          ),
        ),
      ),
    );
  }
}
