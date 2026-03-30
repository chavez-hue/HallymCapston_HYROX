import 'package:flutter/material.dart';
import 'constants/app_theme.dart';
import 'screens/splash/splash_screen.dart';

class RRPApp extends StatelessWidget {
  const RRPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RRP',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}