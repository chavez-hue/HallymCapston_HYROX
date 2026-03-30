import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_spacing.dart';
import '../../widgets/common/app_button.dart';
import '../running/run_start_screen.dart';

class RunningReadyScreen extends StatefulWidget {
  const RunningReadyScreen({super.key});

  @override
  State<RunningReadyScreen> createState() => _RunningReadyScreenState();
}

class _RunningReadyScreenState extends State<RunningReadyScreen> {
  String selectedMode = 'RANDOM';

  void _selectMode(String mode) {
    setState(() {
      selectedMode = mode;
    });
  }

  void _handleStart() {
    // TODO: 선택한 러닝 모드에 따라 기능 연결
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const RunStartScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                'Ready to Run',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose your running mode',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 28),

              _ModeCard(
                title: 'RANDOM',
                textColor: AppColors.primaryOrange,
                isSelected: selectedMode == 'RANDOM',
                onTap: () => _selectMode('RANDOM'),
              ),

              const SizedBox(height: 16),

              _ModeCard(
                title: 'CUSTOM',
                textColor: AppColors.neonGreen,
                isSelected: selectedMode == 'CUSTOM',
                onTap: () => _selectMode('CUSTOM'),
              ),

              const SizedBox(height: 16),

              Text(
                'Selected: $selectedMode',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),

              const Spacer(),

              AppButton(
                text: 'START',
                height: 60,
                fontSize: 20,
                onPressed: _handleStart,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModeCard extends StatelessWidget {
  final String title;
  final Color textColor;
  final bool isSelected;
  final VoidCallback onTap;

  const _ModeCard({
    required this.title,
    required this.textColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 28),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isSelected ? textColor : Colors.transparent,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}