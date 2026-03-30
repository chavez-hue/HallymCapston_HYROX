import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/running/running_bottom_panel.dart';
import '../../widgets/running/running_map_placeholder.dart';
import 'run_pause_screen.dart';

class RunStartScreen extends StatelessWidget {
  const RunStartScreen({super.key});

  void _handlePause(BuildContext context) {
    // TODO: 러닝 일시정지 기능 연결
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const RunPauseScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: SafeArea(
          child: Column(
            children: [
              const Expanded(
                flex: 6,
                child: RunningMapPlaceholder(),
              ),
              Expanded(
                flex: 4,
                child: RunningBottomPanel(
                  onPause: () => _handlePause(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}