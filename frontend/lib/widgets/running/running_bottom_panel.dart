import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import 'running_stat_box.dart';

class RunningBottomPanel extends StatelessWidget {
  final VoidCallback onPause;

  const RunningBottomPanel({
    super.key,
    required this.onPause,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: AppColors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            '2.35 km',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: AppColors.white,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RunningStatBox(
                label: 'Pace',
                value: '5\'40"',
              ),
              RunningStatBox(
                label: 'Time',
                value: '13:22',
              ),
            ],
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: ElevatedButton(
              onPressed: onPause,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryOrange,
                shape: const CircleBorder(),
              ),
              child: const Icon(
                Icons.pause,
                size: 32,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}