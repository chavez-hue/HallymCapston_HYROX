import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_spacing.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                'Profile',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is ProfileError) {
                    return Text(state.message,
                        style: const TextStyle(color: AppColors.white));
                  }
                  if (state is ProfileLoaded) {
                    final p = state.profile;
                    return Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundColor: AppColors.lightGray,
                              backgroundImage: p.photoUrl != null
                                  ? NetworkImage(p.photoUrl!)
                                  : null,
                              child: p.photoUrl == null
                                  ? const Icon(Icons.person,
                                      color: AppColors.black)
                                  : null,
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white,
                                  ),
                                ),
                                Text(
                                  p.level,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.primaryOrange,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _StatRow(label: 'Puzzles', value: '${p.puzzleCount}'),
                        _StatRow(
                            label: 'Distance',
                            value:
                                '${p.totalDistanceKm.toStringAsFixed(1)} km'),
                        _StatRow(label: 'Best Pace', value: p.bestPace),
                        _StatRow(label: 'Total Time', value: p.totalRunTime),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final String value;

  const _StatRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 14, color: AppColors.textSecondary)),
          Text(value,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white)),
        ],
      ),
    );
  }
}
