import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_colors.dart';
import '../../features/running/domain/entities/run_record.dart';
import '../../features/running/presentation/bloc/history_bloc.dart';
import '../../features/shape/domain/entities/shape_grade.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryBloc>().loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'History',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Your running records',
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<HistoryBloc, HistoryState>(
                  builder: (context, state) {
                    if (state is HistoryLoading || state is HistoryInitial) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryOrange,
                        ),
                      );
                    }

                    if (state is HistoryError) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.error_outline,
                                color: AppColors.textSecondary, size: 48),
                            const SizedBox(height: 12),
                            Text(
                              state.message,
                              style: const TextStyle(
                                  color: AppColors.textSecondary),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: () =>
                                  context.read<HistoryBloc>().loadHistory(),
                              child: const Text('다시 시도',
                                  style: TextStyle(
                                      color: AppColors.primaryOrange)),
                            ),
                          ],
                        ),
                      );
                    }

                    final records =
                        (state as HistoryLoaded).records;

                    if (records.isEmpty) {
                      return const Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.directions_run,
                                color: AppColors.textSecondary, size: 56),
                            SizedBox(height: 16),
                            Text(
                              '아직 러닝 기록이 없어요',
                              style: TextStyle(
                                  fontSize: 16, color: AppColors.textSecondary),
                            ),
                            SizedBox(height: 6),
                            Text(
                              '첫 번째 러닝을 시작해보세요!',
                              style: TextStyle(
                                  fontSize: 13, color: AppColors.gray),
                            ),
                          ],
                        ),
                      );
                    }

                    return Column(
                      children: [
                        _SummaryRow(totalRuns: records.length),
                        const SizedBox(height: 16),
                        Expanded(
                          child: ListView.separated(
                            itemCount: records.length,
                            separatorBuilder: (_, _i) =>
                                const SizedBox(height: 10),
                            itemBuilder: (context, index) =>
                                _RunCard(record: records[index]),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final int totalRuns;

  const _SummaryRow({required this.totalRuns});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SummaryCard(label: 'Total Runs', value: '$totalRuns'),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 13, color: AppColors.textSecondary)),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white)),
        ],
      ),
    );
  }
}

class _RunCard extends StatelessWidget {
  final RunRecord record;

  const _RunCard({required this.record});

  static Color _gradeColor(ShapeGrade g) => switch (g) {
        ShapeGrade.bronze => AppColors.gradeBronze,
        ShapeGrade.silver => AppColors.gradeSilver,
        ShapeGrade.gold => AppColors.gradeGold,
      };

  @override
  Widget build(BuildContext context) {
    final dt = record.startedAt;
    final dateLabel =
        '${dt.year}.${dt.month.toString().padLeft(2, '0')}.${dt.day.toString().padLeft(2, '0')}  '
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    final h = record.duration.inHours;
    final m = record.duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s =
        record.duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    final timeLabel = h > 0 ? '$h:$m:$s' : '$m:$s';
    final shapeText = record.shapeLabel ??
        (record.mode == 'random' ? 'Random' : 'Custom');
    final modeColor = record.mode == 'random'
        ? AppColors.primaryOrange
        : AppColors.neonGreen;

    // 인정 조건 3가지 모두 충족 시 등급 표시
    final grade = record.mode == 'random'
        ? ShapeGradeX.check(
            distanceKm: record.distanceKm,
            avgPaceStr: record.avgPace,
            similarityScore: record.shapeSimilarity,
          )
        : null;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: grade != null
            ? Border.all(
                color: _gradeColor(grade).withValues(alpha: 0.5),
                width: 1,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dateLabel,
                style: const TextStyle(
                    fontSize: 13, color: AppColors.textSecondary),
              ),
              Row(
                children: [
                  if (grade != null) ...[
                    _GradeChip(grade: grade),
                    const SizedBox(width: 6),
                  ],
                  _ModeChip(label: record.mode.toUpperCase(), color: modeColor),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            shapeText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _StatItem(
                icon: Icons.straighten,
                value: '${record.distanceKm.toStringAsFixed(2)} km',
              ),
              const SizedBox(width: 20),
              _StatItem(icon: Icons.timer, value: timeLabel),
              const SizedBox(width: 20),
              _StatItem(icon: Icons.speed, value: record.avgPace),
              if (record.mode == 'random' && record.shapeSimilarity > 0) ...[
                const SizedBox(width: 20),
                _StatItem(
                  icon: Icons.analytics_outlined,
                  value: '${record.shapeSimilarity.toStringAsFixed(0)}점',
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _GradeChip extends StatelessWidget {
  final ShapeGrade grade;

  const _GradeChip({required this.grade});

  Color get _color => switch (grade) {
        ShapeGrade.bronze => AppColors.gradeBronze,
        ShapeGrade.silver => AppColors.gradeSilver,
        ShapeGrade.gold => AppColors.gradeGold,
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.15),
        border: Border.all(color: _color.withValues(alpha: 0.7)),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        grade.label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: _color,
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;

  const _StatItem({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: AppColors.textSecondary),
        const SizedBox(width: 4),
        Text(value,
            style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class _ModeChip extends StatelessWidget {
  final String label;
  final Color color;

  const _ModeChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: color.withValues(alpha: 0.6)),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label,
          style: TextStyle(
              fontSize: 11, fontWeight: FontWeight.w600, color: color)),
    );
  }
}
