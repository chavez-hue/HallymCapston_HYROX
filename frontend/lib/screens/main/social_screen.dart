import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_colors.dart';
import '../../core/di/injection.dart';
import '../../features/feed/data/datasources/feed_remote_datasource.dart';
import '../../features/feed/domain/entities/run_feed_item.dart';
import '../../features/feed/presentation/cubit/social_cubit.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = fb.FirebaseAuth.instance.currentUser?.uid ?? '';

    return BlocProvider(
      create: (_) => SocialCubit(
        dataSource: getIt<FeedRemoteDataSource>(),
        currentUserId: uid,
      )..load(),
      child: const _SocialView(),
    );
  }
}

class _SocialView extends StatelessWidget {
  const _SocialView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Social',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'See what other runners are sharing.',
                    style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<SocialCubit, SocialState>(
                builder: (context, state) {
                  if (state is SocialLoading || state is SocialInitial) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryOrange,
                      ),
                    );
                  }

                  if (state is SocialError) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.error_outline,
                              color: AppColors.textSecondary, size: 48),
                          const SizedBox(height: 12),
                          Text(
                            state.message,
                            style: const TextStyle(color: AppColors.textSecondary),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: () => context.read<SocialCubit>().load(),
                            child: const Text('다시 시도',
                                style: TextStyle(color: AppColors.primaryOrange)),
                          ),
                        ],
                      ),
                    );
                  }

                  final items = (state as SocialLoaded).items;

                  if (items.isEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.directions_run,
                              color: AppColors.textSecondary, size: 56),
                          SizedBox(height: 16),
                          Text(
                            '아직 공유된 러닝이 없어요',
                            style: TextStyle(
                                fontSize: 16, color: AppColors.textSecondary),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '첫 번째 러닝을 완료하면 자동으로 공유됩니다!',
                            style: TextStyle(
                                fontSize: 13, color: AppColors.gray),
                          ),
                        ],
                      ),
                    );
                  }

                  return RefreshIndicator(
                    color: AppColors.primaryOrange,
                    backgroundColor: AppColors.surface,
                    onRefresh: () => context.read<SocialCubit>().load(),
                    child: ListView.separated(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      itemCount: items.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return _FeedCard(item: items[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── 피드 카드 ────────────────────────────────────────────────────

class _FeedCard extends StatelessWidget {
  final RunFeedItem item;

  const _FeedCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final dt = item.createdAt;
    final dateLabel =
        '${dt.year}.${dt.month.toString().padLeft(2, '0')}.${dt.day.toString().padLeft(2, '0')}  '
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';

    final h = item.durationSeconds ~/ 3600;
    final m = ((item.durationSeconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final s = (item.durationSeconds % 60).toString().padLeft(2, '0');
    final timeLabel = h > 0 ? '$h:$m:$s' : '$m:$s';

    final isRandom = item.mode == 'random';
    final shapeText = item.shapeLabel ??
        (isRandom ? 'Random' : 'Custom');
    final modeColor =
        isRandom ? AppColors.primaryOrange : AppColors.neonGreen;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 헤더: 아바타 + 이름 + 날짜 + 모드칩 ──────────────
          Row(
            children: [
              _Avatar(photoUrl: item.userPhotoUrl, size: 38),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.userName,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(dateLabel,
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.textSecondary)),
                  ],
                ),
              ),
              _ModeChip(label: item.mode.toUpperCase(), color: modeColor),
            ],
          ),
          const SizedBox(height: 14),

          // ── 도형 이름 ─────────────────────────────────────────
          Text(
            shapeText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),

          // ── 유사도 (랜덤 모드만) ──────────────────────────────
          if (isRandom && item.shapeSimilarity > 0) ...[
            const SizedBox(height: 6),
            _SimilarityBar(score: item.shapeSimilarity),
          ],
          const SizedBox(height: 12),

          // ── 스탯: 거리 / 시간 / 페이스 ───────────────────────
          Row(
            children: [
              _StatItem(icon: Icons.straighten,
                  value: '${item.distanceKm.toStringAsFixed(2)} km'),
              const SizedBox(width: 18),
              _StatItem(icon: Icons.timer, value: timeLabel),
              const SizedBox(width: 18),
              _StatItem(icon: Icons.speed, value: item.avgPace),
            ],
          ),
          const SizedBox(height: 14),

          // ── 좋아요 버튼 ───────────────────────────────────────
          GestureDetector(
            onTap: () => context
                .read<SocialCubit>()
                .toggleLike(item.id, item.isLikedByMe),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item.isLikedByMe
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  size: 20,
                  color: item.isLikedByMe
                      ? AppColors.primaryOrange
                      : AppColors.textSecondary,
                ),
                const SizedBox(width: 5),
                Text(
                  '${item.likeCount}',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: item.isLikedByMe
                        ? AppColors.primaryOrange
                        : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── 유사도 바 ─────────────────────────────────────────────────────

class _SimilarityBar extends StatelessWidget {
  final double score; // 0-100

  const _SimilarityBar({required this.score});

  @override
  Widget build(BuildContext context) {
    final isPassed = score >= 70;
    final barColor =
        isPassed ? AppColors.primaryOrange : AppColors.textSecondary;

    return Row(
      children: [
        Text(
          '${score.toStringAsFixed(0)}점',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: barColor,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: score / 100,
              backgroundColor: AppColors.border,
              valueColor: AlwaysStoppedAnimation<Color>(barColor),
              minHeight: 6,
            ),
          ),
        ),
        if (isPassed) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.primaryOrange.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                  color: AppColors.primaryOrange.withValues(alpha: 0.5)),
            ),
            child: const Text(
              'PASS',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryOrange,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

// ── 헬퍼 위젯 ────────────────────────────────────────────────────

class _Avatar extends StatelessWidget {
  final String? photoUrl;
  final double size;

  const _Avatar({this.photoUrl, required this.size});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: AppColors.border,
      backgroundImage: photoUrl != null ? NetworkImage(photoUrl!) : null,
      child: photoUrl == null
          ? Icon(Icons.person_rounded,
              size: size * 0.55, color: AppColors.textSecondary)
          : null,
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
