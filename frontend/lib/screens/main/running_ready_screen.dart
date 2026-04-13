import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_spacing.dart';
import '../../widgets/common/app_button.dart';

class RunningReadyScreen extends StatefulWidget {
  const RunningReadyScreen({super.key});

  @override
  State<RunningReadyScreen> createState() => _RunningReadyScreenState();
}

class _RunningReadyScreenState extends State<RunningReadyScreen> {
  String _selectedMode = 'RANDOM';

  void _handleStart() {
    if (_selectedMode == 'RANDOM') {
      context.push('/roulette');
    } else {
      context.push('/custom-shape');
    }
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
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 32),

              _ModeCard(
                icon: Icons.casino_rounded,
                title: 'RANDOM',
                description: '랜덤 도형이 주어집니다',
                isSelected: _selectedMode == 'RANDOM',
                onTap: () => setState(() => _selectedMode = 'RANDOM'),
              ),

              const SizedBox(height: 16),

              _ModeCard(
                icon: Icons.edit_rounded,
                title: 'CUSTOM',
                description: '직접 도형을 그려보세요',
                isSelected: _selectedMode == 'CUSTOM',
                onTap: () => setState(() => _selectedMode = 'CUSTOM'),
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
  final IconData icon;
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const _ModeCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? AppColors.primaryOrange.withValues(alpha: 0.10)
          : AppColors.surface,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? AppColors.primaryOrange : AppColors.border,
              width: isSelected ? 2.0 : 1.0,
            ),
          ),
          child: Row(
            children: [
              // 아이콘 박스
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryOrange
                      : AppColors.border,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  size: 26,
                  color: isSelected ? AppColors.white : AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 20),

              // 텍스트
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: isSelected
                            ? AppColors.primaryOrange
                            : AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              // 선택 표시
              if (isSelected)
                const Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.primaryOrange,
                  size: 22,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
