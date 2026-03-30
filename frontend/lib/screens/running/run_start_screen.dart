import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../widgets/running/running_bottom_panel.dart';
import '../../widgets/running/running_map_placeholder.dart';
import 'run_pause_screen.dart';

class RunStartScreen extends StatelessWidget {
  const RunStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onPause: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RunPauseScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}