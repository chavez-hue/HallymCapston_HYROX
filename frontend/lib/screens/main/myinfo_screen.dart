import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_spacing.dart';
import '../../core/di/injection.dart';
import '../../features/profile/domain/entities/collection_item.dart';
import '../../features/profile/domain/repositories/profile_repository.dart';
import '../../features/profile/presentation/cubit/myinfo_cubit.dart';
import '../../features/running/domain/repositories/run_repository.dart';
import '../../features/shape/domain/entities/shape_grade.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = fb.FirebaseAuth.instance.currentUser?.uid ?? '';
    return BlocProvider(
      create: (_) => MyInfoCubit(
        profileRepo: getIt<ProfileRepository>(),
        runRepo: getIt<RunRepository>(),
      )..load(uid),
      child: const _MyInfoView(),
    );
  }
}

class _MyInfoView extends StatelessWidget {
  const _MyInfoView();

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
                'My Info',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<MyInfoCubit, MyInfoState>(
                builder: (context, state) {
                  if (state is MyInfoLoading || state is MyInfoInitial) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryOrange,
                        ),
                      ),
                    );
                  }
                  if (state is MyInfoError) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: AppColors.textSecondary),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  if (state is MyInfoLoaded) {
                    return Expanded(child: _LoadedContent(state: state));
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

// ── 로드 완료 콘텐츠 ────────────────────────────────────────────

class _LoadedContent extends StatelessWidget {
  final MyInfoLoaded state;

  const _LoadedContent({required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── 프로필 카드 ──────────────────────────────────────────
        _ProfileCard(
          name: state.name,
          email: state.email,
          photoUrl: state.photoUrl,
          level: state.level,
        ),

        const SizedBox(height: 16),

        // ── 통계 2×2 ────────────────────────────────────────────
        Row(
          children: [
            Expanded(
              child: _StatCard(
                title: 'Puzzles',
                value: '${state.puzzleCount}',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                title: 'Pace',
                value: state.avgPace,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: _StatCard(
                title: 'Time',
                value: state.totalRunTime.isNotEmpty ? state.totalRunTime : '-',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                title: 'Level',
                value: state.level,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // ── Collection ──────────────────────────────────────────
        const Text(
          'Collection',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),

        const SizedBox(height: 12),

        Expanded(
          child: state.collectionItems.isEmpty
              ? Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(
                    child: Text(
                      '완성한 도형이 없습니다\n랜덤 모드에서 1km 이상, 페이스 10분/km 이하,\n유사도 70점 이상을 달성해보세요!',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : ListView.separated(
                  itemCount: state.collectionItems.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (_, i) =>
                      _CollectionCard(item: state.collectionItems[i]),
                ),
        ),
      ],
    );
  }
}

// ── 프로필 카드 ──────────────────────────────────────────────────

class _ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String? photoUrl;
  final String level;

  const _ProfileCard({
    required this.name,
    required this.email,
    this.photoUrl,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.lightGray,
            backgroundImage:
                photoUrl != null ? NetworkImage(photoUrl!) : null,
            child: photoUrl == null
                ? const Icon(Icons.person, color: AppColors.black)
                : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.isNotEmpty ? name : '이름 없음',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // 레벨 배지
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _levelColor(level).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _levelColor(level), width: 1),
            ),
            child: Text(
              level,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: _levelColor(level),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _levelColor(String level) {
    switch (level) {
      case 'Master':
        return AppColors.primaryOrange;
      case 'Expert':
        return AppColors.neonGreen;
      case 'Runner':
        return const Color(0xFF4FC3F7); // light blue
      default:
        return AppColors.textSecondary;
    }
  }
}

// ── 통계 카드 ─────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Collection 카드 ───────────────────────────────────────────────

class _CollectionCard extends StatelessWidget {
  final CollectionItem item;

  const _CollectionCard({required this.item});

  Color _gradeColor(ShapeGrade g) => switch (g) {
        ShapeGrade.bronze => AppColors.gradeBronze,
        ShapeGrade.silver => AppColors.gradeSilver,
        ShapeGrade.gold => AppColors.gradeGold,
      };

  @override
  Widget build(BuildContext context) {
    final d = item.date;
    final dateStr =
        '${d.year}.${d.month.toString().padLeft(2, '0')}.${d.day.toString().padLeft(2, '0')}';
    final scoreInt = item.score.toInt();
    final gradeColor = _gradeColor(item.grade);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: gradeColor.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // 도형 아이콘 (등급 색상)
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: gradeColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                _shapeEmoji(item.shapeLabel),
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),

          const SizedBox(width: 14),

          // 도형 이름 + 날짜 + 거리
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      item.shapeLabel,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // 등급 배지
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(
                        color: gradeColor.withValues(alpha: 0.15),
                        border: Border.all(
                            color: gradeColor.withValues(alpha: 0.7)),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        item.grade.label,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: gradeColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  '$dateStr  ·  ${item.distanceKm.toStringAsFixed(2)} km',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // 점수
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$scoreInt점',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '인정',
                style: TextStyle(
                  fontSize: 11,
                  color: gradeColor.withValues(alpha: 0.9),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _shapeEmoji(String label) {
    switch (label) {
      case '원':
        return '⭕';
      case '삼각형':
        return '△';
      case '사각형':
        return '□';
      case '별':
        return '★';
      case '하트':
        return '♥';
      case '오각형':
        return '⬠';
      default:
        return '◈';
    }
  }
}
