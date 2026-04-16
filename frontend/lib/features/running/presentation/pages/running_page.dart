import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/app_colors.dart';
import '../../../../core/utils/location_permission_helper.dart';
import '../bloc/running_bloc.dart';
import '../bloc/running_event.dart';
import '../bloc/running_state.dart';
import '../widgets/gps_map_view.dart';
import '../widgets/run_stats_bar.dart';

class RunningPage extends StatelessWidget {
  final String mode;
  final String? shapeLabel;

  const RunningPage({super.key, this.mode = 'random', this.shapeLabel});

  void _navigateToResult(BuildContext context, RunningFinished state) {
    final record = state.record;
    context.go('/run-result', extra: {
      'record': record,
      'mode': record.mode,
      'shapeLabel': record.shapeLabel,
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RunningBloc, RunningState>(
      listener: (context, state) {
        if (state is RunningFinished) {
          _navigateToResult(context, state);
        }
        if (state is RunningError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is RunningIdle || state is RunningError) {
          return _IdleScreen(
            mode: mode,
            shapeLabel: shapeLabel,
            onStart: () => context
                .read<RunningBloc>()
                .add(RunningEvent.startRequested(
                  mode: mode,
                  shapeLabel: shapeLabel,
                )),
          );
        }

        return PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: AppColors.black,
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: GpsMapView(mode: mode, shapeLabel: shapeLabel),
                  ),
                  Expanded(
                    flex: 4,
                    child: RunStatsBar(
                      distanceKm: state is RunningActive
                          ? state.distanceKm
                          : state is RunningPaused
                              ? state.distanceKm
                              : 0,
                      elapsed: state is RunningActive
                          ? state.elapsed
                          : state is RunningPaused
                              ? state.elapsed
                              : Duration.zero,
                      pace: state is RunningActive
                          ? state.currentPace
                          : "--'--\"",
                      isPaused: state is RunningPaused,
                      onPause: () => context
                          .read<RunningBloc>()
                          .add(const RunningEvent.pauseRequested()),
                      onResume: () => context
                          .read<RunningBloc>()
                          .add(const RunningEvent.resumeRequested()),
                      onStop: () => context
                          .read<RunningBloc>()
                          .add(const RunningEvent.stopRequested()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _IdleScreen extends StatefulWidget {
  final VoidCallback onStart;
  final String? mode;
  final String? shapeLabel;

  const _IdleScreen({
    required this.onStart,
    this.mode,
    this.shapeLabel,
  });

  @override
  State<_IdleScreen> createState() => _IdleScreenState();
}

class _IdleScreenState extends State<_IdleScreen> {
  bool _requesting = false;

  /// 시작 버튼 탭 처리:
  ///   1. 위치 권한 확인 및 요청
  ///   2. 허용된 경우에만 GPS 스트림 시작
  Future<void> _handleStart() async {
    if (_requesting) return;
    setState(() => _requesting = true);

    final granted = await LocationPermissionHelper.request(context);

    if (!mounted) return;
    setState(() => _requesting = false);

    if (granted) widget.onStart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        title: const Text(
          'RUN',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: AppColors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/home'),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            GpsMapView(mode: widget.mode, shapeLabel: widget.shapeLabel),
            Positioned(
              bottom: 48,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '러닝을 시작하세요',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: _requesting ? null : _handleStart,
                      child: Container(
                        width: 88,
                        height: 88,
                        decoration: BoxDecoration(
                          color: _requesting
                              ? AppColors.primaryOrange.withValues(alpha: 0.5)
                              : AppColors.primaryOrange,
                          shape: BoxShape.circle,
                        ),
                        child: _requesting
                            ? const Padding(
                                padding: EdgeInsets.all(24),
                                child: CircularProgressIndicator(
                                  color: AppColors.white,
                                  strokeWidth: 3,
                                ),
                              )
                            : const Icon(
                                Icons.play_arrow_rounded,
                                size: 52,
                                color: AppColors.white,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

