import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_colors.dart';
import '../../core/di/injection.dart';
import '../../features/running/domain/usecases/get_run_stats.dart';
import '../../features/running/presentation/bloc/history_bloc.dart';
import '../../features/ranking/presentation/pages/ranking_page.dart';
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

  void _onTapNav(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // late final 대신 build 안에서 생성 → nav item 수와 항상 일치.
    // IndexedStack이 모든 자식을 트리에 유지하므로 탭 전환 시 상태 보존됨.
    final screens = [
      const HomeScreen(),
      BlocProvider(
        create: (_) => HistoryBloc(getIt<GetRunStats>()),
        child: const HistoryScreen(),
      ),
      const RunningReadyScreen(),
      const SocialScreen(),
      const RankingPage(),
      const MyInfoScreen(),
    ];

    assert(
      screens.length == 6,
      'screens(${screens.length})와 nav items(6)의 수가 다릅니다.',
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTapNav,
      ),
    );
  }
}