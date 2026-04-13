import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_spacing.dart';
import '../../../../core/di/injection.dart';
import '../../domain/entities/ranking_entry.dart';
import '../bloc/ranking_bloc.dart';
import '../bloc/ranking_event.dart';
import '../bloc/ranking_state.dart';

// ── 메달 색상 ────────────────────────────────────────────────────
const _gold   = Color(0xFFFFD700);
const _silver = Color(0xFFBDBDBD);
const _bronze = Color(0xFFCD7F32);

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<RankingBloc>()..add(const RankingEvent.loadRequested()),
      child: const _RankingView(),
    );
  }
}

class _RankingView extends StatelessWidget {
  const _RankingView();

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
                'Ranking',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<RankingBloc, RankingState>(
                  builder: (context, state) {
                    if (state is RankingLoading || state is RankingInitial) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryOrange,
                        ),
                      );
                    }
                    if (state is RankingError) {
                      return _ErrorView(
                        message: state.message,
                        onRetry: () => context
                            .read<RankingBloc>()
                            .add(const RankingEvent.loadRequested()),
                      );
                    }
                    if (state is RankingLoaded) {
                      return _LoadedView(
                        entries: state.entries,
                        myEntry: state.myEntry,
                      );
                    }
                    return const SizedBox.shrink();
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

// ── 로드 완료 뷰 ─────────────────────────────────────────────────

class _LoadedView extends StatelessWidget {
  final List<RankingEntry> entries;
  final RankingEntry? myEntry;

  const _LoadedView({required this.entries, this.myEntry});

  @override
  Widget build(BuildContext context) {
    final currentUserId =
        fb.FirebaseAuth.instance.currentUser?.uid ?? '';

    return Column(
      children: [
        // ── 내 순위 카드 ─────────────────────────────────────────
        if (myEntry != null) ...[
          _MyRankCard(entry: myEntry!),
          const SizedBox(height: 20),
        ],

        // ── 전체 랭킹 리스트 ─────────────────────────────────────
        if (entries.isEmpty)
          const Expanded(
            child: Center(
              child: Text(
                '아직 랭킹 데이터가 없습니다.',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          )
        else
          Expanded(
            child: ListView.separated(
              itemCount: entries.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (_, i) {
                final entry = entries[i];
                return _RankCard(
                  entry: entry,
                  isMe: entry.userId == currentUserId,
                );
              },
            ),
          ),
      ],
    );
  }
}

// ── 내 순위 강조 카드 ────────────────────────────────────────────

class _MyRankCard extends StatelessWidget {
  final RankingEntry entry;

  const _MyRankCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    final level = _levelFromCount(entry.puzzleCount);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryOrange, width: 1.5),
      ),
      child: Row(
        children: [
          // 내 순위 배지
          Column(
            children: [
              Text(
                '내 순위',
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.primaryOrange,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                entry.rank > 0 ? '#${entry.rank}' : '-',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: AppColors.primaryOrange,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // 아바타
          _Avatar(photoUrl: entry.userPhotoUrl, size: 40),
          const SizedBox(width: 12),
          // 이름 + 레벨
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.userName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                _LevelBadge(level: level),
              ],
            ),
          ),
          // 퍼즐 수
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${entry.puzzleCount}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: AppColors.white,
                ),
              ),
              const Text(
                'puzzles',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── 일반 랭킹 카드 ───────────────────────────────────────────────

class _RankCard extends StatelessWidget {
  final RankingEntry entry;
  final bool isMe;

  const _RankCard({required this.entry, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final level = _levelFromCount(entry.puzzleCount);
    final isMedal = entry.rank <= 3;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isMe
            ? AppColors.primaryOrange.withValues(alpha: 0.08)
            : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: isMe
            ? Border.all(
                color: AppColors.primaryOrange.withValues(alpha: 0.5),
                width: 1,
              )
            : null,
      ),
      child: Row(
        children: [
          // 순위 / 메달
          SizedBox(
            width: 40,
            child: isMedal
                ? _MedalIcon(rank: entry.rank)
                : Text(
                    '#${entry.rank}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isMe
                          ? AppColors.primaryOrange
                          : AppColors.textSecondary,
                    ),
                  ),
          ),
          const SizedBox(width: 8),
          // 아바타
          _Avatar(photoUrl: entry.userPhotoUrl, size: 36),
          const SizedBox(width: 12),
          // 이름 + 레벨
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        entry.userName,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: isMe
                              ? AppColors.primaryOrange
                              : AppColors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (isMe) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(
                          color: AppColors.primaryOrange,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'ME',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w900,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 3),
                _LevelBadge(level: level, small: true),
              ],
            ),
          ),
          // 퍼즐 수
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${entry.puzzleCount}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: isMedal ? _medalColor(entry.rank) : AppColors.white,
                ),
              ),
              const Text(
                'puzzles',
                style: TextStyle(fontSize: 10, color: AppColors.textSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── 메달 아이콘 ──────────────────────────────────────────────────

class _MedalIcon extends StatelessWidget {
  final int rank;

  const _MedalIcon({required this.rank});

  @override
  Widget build(BuildContext context) {
    final color = _medalColor(rank);
    final emoji = rank == 1 ? '🥇' : rank == 2 ? '🥈' : '🥉';

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 26)),
        // 순위 숫자 (작은 배지)
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$rank',
              style: const TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w900,
                color: AppColors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── 레벨 배지 ────────────────────────────────────────────────────

class _LevelBadge extends StatelessWidget {
  final String level;
  final bool small;

  const _LevelBadge({required this.level, this.small = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: small ? 6 : 8,
        vertical: small ? 1 : 3,
      ),
      decoration: BoxDecoration(
        color: _levelColor(level).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _levelColor(level).withValues(alpha: 0.6),
          width: 1,
        ),
      ),
      child: Text(
        level,
        style: TextStyle(
          fontSize: small ? 10 : 11,
          fontWeight: FontWeight.w700,
          color: _levelColor(level),
        ),
      ),
    );
  }
}

// ── 아바타 ───────────────────────────────────────────────────────

class _Avatar extends StatelessWidget {
  final String? photoUrl;
  final double size;

  const _Avatar({this.photoUrl, required this.size});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: AppColors.border,
      backgroundImage:
          photoUrl != null ? NetworkImage(photoUrl!) : null,
      child: photoUrl == null
          ? Icon(Icons.person_rounded,
              size: size * 0.55, color: AppColors.textSecondary)
          : null,
    );
  }
}

// ── 에러 뷰 ──────────────────────────────────────────────────────

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: onRetry,
            child: const Text(
              '다시 시도',
              style: TextStyle(color: AppColors.primaryOrange),
            ),
          ),
        ],
      ),
    );
  }
}

// ── 유틸 ─────────────────────────────────────────────────────────

String _levelFromCount(int count) {
  if (count >= 20) return 'Master';
  if (count >= 10) return 'Expert';
  if (count >= 5) return 'Runner';
  return 'Beginner';
}

Color _levelColor(String level) {
  switch (level) {
    case 'Master':
      return AppColors.primaryOrange;
    case 'Expert':
      return AppColors.neonGreen;
    case 'Runner':
      return const Color(0xFF4FC3F7);
    default:
      return AppColors.textSecondary;
  }
}

Color _medalColor(int rank) {
  switch (rank) {
    case 1:
      return _gold;
    case 2:
      return _silver;
    case 3:
      return _bronze;
    default:
      return AppColors.white;
  }
}
