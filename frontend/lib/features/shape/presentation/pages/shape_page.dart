import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_spacing.dart';
import '../bloc/shape_bloc.dart';
import '../bloc/shape_event.dart';
import '../bloc/shape_state.dart';
import '../widgets/shape_canvas.dart';

class ShapePage extends StatelessWidget {
  const ShapePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<ShapeBloc>()
        ..add(const ShapeEvent.missionsLoadRequested()),
      child: const _ShapeView(),
    );
  }
}

class _ShapeView extends StatelessWidget {
  const _ShapeView();

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
                'Shape Mission',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Draw the target shape with your run.',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              const SizedBox(height: 24),
              const Expanded(child: ShapeCanvas()),
              const SizedBox(height: 16),
              BlocBuilder<ShapeBloc, ShapeState>(
                builder: (context, state) {
                  if (state is ShapeAnalysisResult) {
                    return Column(
                      children: [
                        Text(
                          'Similarity: ${(state.result.similarityScore * 100).toStringAsFixed(1)}%',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.neonGreen,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          state.result.isPassed ? 'PASSED!' : 'Try again',
                          style: TextStyle(
                            fontSize: 16,
                            color: state.result.isPassed
                                ? AppColors.neonGreen
                                : AppColors.primaryOrange,
                          ),
                        ),
                      ],
                    );
                  }
                  if (state is ShapeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
