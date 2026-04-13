import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';

class RunStatsBar extends StatelessWidget {
  final double distanceKm;
  final Duration elapsed;
  final String pace;
  final bool isPaused;
  final VoidCallback onPause;
  final VoidCallback onResume;
  final VoidCallback onStop;

  const RunStatsBar({
    super.key,
    required this.distanceKm,
    required this.elapsed,
    required this.pace,
    required this.isPaused,
    required this.onPause,
    required this.onResume,
    required this.onStop,
  });

  String get _elapsedLabel {
    final h = elapsed.inHours;
    final m = elapsed.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = elapsed.inSeconds.remainder(60).toString().padLeft(2, '0');
    if (h > 0) return '$h:$m:$s';
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: AppColors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '${distanceKm.toStringAsFixed(2)} km',
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: AppColors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _StatBox(label: 'Pace', value: pace),
              _StatBox(label: 'Time', value: _elapsedLabel),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (isPaused) ...[
                _ActionButton(
                  icon: Icons.play_arrow,
                  color: AppColors.neonGreen,
                  onTap: onResume,
                ),
                _ActionButton(
                  icon: Icons.stop,
                  color: AppColors.primaryOrange,
                  onTap: onStop,
                ),
              ] else
                _ActionButton(
                  icon: Icons.pause,
                  color: AppColors.primaryOrange,
                  onTap: onPause,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String label;
  final String value;

  const _StatBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 14, color: AppColors.textSecondary)),
        const SizedBox(height: 6),
        Text(value,
            style: const TextStyle(
                fontSize: 18,
                color: AppColors.white,
                fontWeight: FontWeight.w700)),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
        ),
        child: Icon(icon, size: 32, color: AppColors.white),
      ),
    );
  }
}
