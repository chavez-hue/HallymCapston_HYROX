import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_spacing.dart';
import '../../core/di/injection.dart';
import '../../features/running/domain/entities/run_record.dart';
import '../../features/running/domain/repositories/run_repository.dart';
import '../../widgets/common/app_button.dart';
import '../../widgets/common/app_card.dart';
import '../../widgets/home/greeting_section.dart';
import 'running_ready_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Future<List<RunRecord>> _historyFuture;

  @override
  void initState() {
    super.initState();
    final uid = fb.FirebaseAuth.instance.currentUser?.uid ?? '';
    _historyFuture = getIt<RunRepository>()
        .getRunHistory(uid)
        .then((result) => result.fold((_) => <RunRecord>[], (r) => r));
  }

  void _goToRunningReady() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RunningReadyScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: FutureBuilder<List<RunRecord>>(
          future: _historyFuture,
          builder: (context, snapshot) {
            final records = snapshot.data ?? [];
            final stats = _calcStats(records);

            return SingleChildScrollView(
              padding: AppSpacing.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  const GreetingSection(),
                  const SizedBox(height: 24),

                  // ── Start Running 카드 ─────────────────────────
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Today\'s Run',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Ready for your next session? Start your run and track your performance.',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        AppButton(
                          text: 'Start Running',
                          onPressed: _goToRunningReady,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ── 통계 카드 2×2 ──────────────────────────────
                  if (snapshot.connectionState == ConnectionState.waiting)
                    const _StatsLoading()
                  else ...[
                    Row(
                      children: [
                        Expanded(
                          child: _SummaryCard(
                            title: 'Distance',
                            value: '${stats.totalDistanceKm.toStringAsFixed(1)} km',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _SummaryCard(
                            title: 'Calories',
                            value: '${stats.totalCalories} kcal',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _SummaryCard(
                            title: 'Avg Pace',
                            value: stats.avgPace,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _SummaryCard(
                            title: 'Monthly Goal',
                            value: '${stats.monthlyDistanceKm.toStringAsFixed(1)} / 10 km',
                          ),
                        ),
                      ],
                    ),
                  ],

                  const SizedBox(height: 20),

                  // ── 최근 러닝 기록 카드 ────────────────────────
                  if (snapshot.connectionState != ConnectionState.waiting)
                    _RecentRunCard(record: records.isNotEmpty ? records.first : null),

                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ── 통계 계산 ────────────────────────────────────────────────────────────────

class _Stats {
  final double totalDistanceKm;
  final int totalCalories;
  final String avgPace;
  final double monthlyDistanceKm;

  const _Stats({
    required this.totalDistanceKm,
    required this.totalCalories,
    required this.avgPace,
    required this.monthlyDistanceKm,
  });
}

_Stats _calcStats(List<RunRecord> records) {
  if (records.isEmpty) {
    return const _Stats(
      totalDistanceKm: 0,
      totalCalories: 0,
      avgPace: "--'--\"",
      monthlyDistanceKm: 0,
    );
  }

  final totalDistance = records.fold(0.0, (sum, r) => sum + r.distanceKm);
  final totalSeconds = records.fold(0, (sum, r) => sum + r.duration.inSeconds);
  final totalCalories = (totalDistance * 60).round();

  // 평균 페이스 계산 (초/km)
  String pace = "--'--\"";
  if (totalDistance > 0) {
    final secsPerKm = (totalSeconds / totalDistance).round();
    final m = secsPerKm ~/ 60;
    final s = secsPerKm % 60;
    pace = "$m'${s.toString().padLeft(2, '0')}\"";
  }

  // 이번 달 누적 거리
  final now = DateTime.now();
  final monthlyDistance = records
      .where((r) => r.startedAt.year == now.year && r.startedAt.month == now.month)
      .fold(0.0, (sum, r) => sum + r.distanceKm);

  return _Stats(
    totalDistanceKm: totalDistance,
    totalCalories: totalCalories,
    avgPace: pace,
    monthlyDistanceKm: monthlyDistance,
  );
}

// ── 위젯 ─────────────────────────────────────────────────────────────────────

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;

  const _SummaryCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsLoading extends StatelessWidget {
  const _StatsLoading();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 120,
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryOrange,
          strokeWidth: 2,
        ),
      ),
    );
  }
}

class _RecentRunCard extends StatelessWidget {
  final RunRecord? record;

  const _RecentRunCard({this.record});

  @override
  Widget build(BuildContext context) {
    if (record == null) {
      return const AppCard(
        child: Row(
          children: [
            Icon(Icons.directions_run_rounded,
                color: AppColors.textSecondary, size: 28),
            SizedBox(width: 12),
            Text(
              '아직 러닝 기록이 없어요',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    final r = record!;
    final date = '${r.startedAt.month}/${r.startedAt.day}';
    final duration = _formatDuration(r.duration);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '최근 러닝',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _RunStat(label: '거리', value: '${r.distanceKm.toStringAsFixed(2)} km'),
              _RunStat(label: '시간', value: duration),
              _RunStat(label: '페이스', value: r.avgPace),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    final s = d.inSeconds.remainder(60);
    if (h > 0) return '${h}h ${m}m';
    return '${m}m ${s.toString().padLeft(2, '0')}s';
  }
}

class _RunStat extends StatelessWidget {
  final String label;
  final String value;

  const _RunStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
