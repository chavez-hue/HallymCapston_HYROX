import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/running/presentation/bloc/running_bloc.dart';
import '../di/injection.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/feed/presentation/pages/feed_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/ranking/presentation/pages/ranking_page.dart';
import '../../features/shape/presentation/pages/shape_page.dart';
import '../../features/running/domain/entities/run_record.dart';
import '../../features/running/presentation/pages/running_page.dart';
import '../../screens/main/main_navigation_screen.dart';
import '../../screens/onboarding/onboarding_select_screen.dart';
import '../../screens/running/custom_shape_screen.dart';
import '../../screens/running/run_result_screen.dart';
import '../../screens/running/roulette_screen.dart';
import '../../screens/social/create_post_screen.dart';
import '../../screens/splash/splash_screen.dart';

// FirebaseAuth 상태 변화를 go_router의 refreshListenable로 연결
class _AuthNotifier extends ChangeNotifier {
  _AuthNotifier() {
    _sub = fb.FirebaseAuth.instance.authStateChanges().listen((_) {
      notifyListeners();
    });
  }

  StreamSubscription<fb.User?>? _sub;

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}

final _authNotifier = _AuthNotifier();

final appRouter = GoRouter(
  initialLocation: '/splash',
  refreshListenable: _authNotifier,
  redirect: (context, state) {
    final isLoggedIn = fb.FirebaseAuth.instance.currentUser != null;
    final location = state.matchedLocation;

    // 스플래시는 redirect 제외
    if (location == '/splash') return null;

    const publicRoutes = ['/login', '/onboarding', '/signup'];

    // 로그인 안 된 상태에서 보호된 페이지 접근 → /login
    if (!isLoggedIn && !publicRoutes.contains(location)) return '/login';

    // 로그인 된 상태에서 public 페이지 접근 → /home
    if (isLoggedIn && publicRoutes.contains(location)) return '/home';

    return null;
  },
  routes: [
    GoRoute(
      path: '/splash',
      builder: (_, __) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (_, __) => const OnboardingSelectScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (_, __) => const LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (_, __) => const SignupPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (_, __) => const MainNavigationScreen(),
    ),
    GoRoute(
      path: '/roulette',
      builder: (_, __) => const RouletteScreen(),
    ),
    GoRoute(
      path: '/custom-shape',
      builder: (_, __) => const CustomShapeScreen(),
    ),
    GoRoute(
      path: '/run',
      builder: (_, state) {
        final extra = state.extra as Map<String, dynamic>? ?? {};
        final mode = extra['mode'] as String? ?? 'random';
        final shapeLabel = extra['shapeLabel'] as String?;
        return BlocProvider(
          create: (_) => getIt<RunningBloc>(),
          child: RunningPage(mode: mode, shapeLabel: shapeLabel),
        );
      },
    ),
    GoRoute(
      path: '/run-result',
      builder: (_, state) {
        final extra = state.extra as Map<String, dynamic>;
        final record = extra['record'] as RunRecord;
        final mode = extra['mode'] as String;
        final shapeLabel = extra['shapeLabel'] as String?;
        return RunResultScreen(record: record, mode: mode, shapeLabel: shapeLabel);
      },
    ),
    GoRoute(
      path: '/shape',
      builder: (_, __) => const ShapePage(),
    ),
    GoRoute(
      path: '/feed',
      builder: (_, __) => const FeedPage(),
    ),
    GoRoute(
      path: '/ranking',
      builder: (_, __) => const RankingPage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (_, __) => const ProfilePage(),
    ),
    GoRoute(
      path: '/create-post',
      builder: (_, __) => const CreatePostScreen(),
    ),
  ],
);
