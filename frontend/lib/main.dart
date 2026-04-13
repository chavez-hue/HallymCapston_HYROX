import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/utils/location_permission_helper.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth_event.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 웹에서 WebSocket 차단 시 HTTP 롱폴링으로 자동 전환 → "client is offline" 오류 방지
  if (kIsWeb) {
    FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: false,
      webExperimentalAutoDetectLongPolling: true,
    );
  }

  await configureDependencies();

  // 앱 시작 시 위치 권한 선제 요청 (미허용·미결 상태인 경우에만 시스템 팝업 표시)
  if (!kIsWeb) await LocationPermissionHelper.requestOnStartup();

  runApp(const RRPApp());
}

class RRPApp extends StatelessWidget {
  const RRPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'RRP',
        routerConfig: appRouter,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFF5C00),
            brightness: Brightness.light,
          ),
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          fontFamily: 'Roboto',
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFF5C00),
            brightness: Brightness.dark,
          ),
          scaffoldBackgroundColor: const Color(0xFF000000),
          fontFamily: 'Roboto',
        ),
        themeMode: ThemeMode.light,
      ),
    );
  }
}
