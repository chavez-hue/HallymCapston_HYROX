import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/common/app_bottom_nav_bar.dart';
import 'home_screen.dart';
import 'history_screen.dart';
import 'running_ready_screen.dart';
import 'social_screen.dart';
import 'myinfo_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    HistoryScreen(),
    RunningReadyScreen(),
    SocialScreen(),
    MyInfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _screens[_currentIndex],
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}