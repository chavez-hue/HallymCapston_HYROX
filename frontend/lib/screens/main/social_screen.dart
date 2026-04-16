import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_colors.dart';
import '../../core/di/injection.dart';
import '../../features/feed/data/datasources/feed_remote_datasource.dart';
import '../../features/feed/domain/entities/comment.dart';
import '../../features/feed/domain/entities/run_feed_item.dart';
import '../../features/feed/presentation/cubit/social_cubit.dart';
import '../social/create_post_screen.dart';

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
            // ── 헤더 ─────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 12, 0),
              child: Row(
                children: [
                  const Expanded(
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
                        SizedBox(height: 2),
                        Text(
                          'See what other runners are sharing.',
                          style: TextStyle(
                              fontSize: 13, color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                  // + 게시 버튼
                  IconButton(
                    onPressed: () async {
                      final cubit = context.read<SocialCubit>();
                      final result = await Navigator.of(context).push<bool>(
                        MaterialPageRoute(
                            builder: (_) => const CreatePostScreen()),
                      );
                      if (result == true) cubit.load();
                    },
                    icon: const Icon(Icons.add_circle_outline_rounded,
                        color: AppColors.primaryOrange, size: 28),
                    tooltip: '게시물 작성',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ── 피드 목록 ──────────────────────────────────────────
            Expanded(
              child: BlocBuilder<SocialCubit, SocialState>(
                builder: (context, state) {
                  if (state is SocialLoading || state is SocialInitial) {
                    return const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.primaryOrange),
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
                          Text(state.message,
                              style: const TextStyle(
                                  color: AppColors.textSecondary),
                              textAlign: TextAlign.center),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: () =>
                                context.read<SocialCubit>().load(),
                            child: const Text('다시 시도',
                                style: TextStyle(
                                    color: AppColors.primaryOrange)),
                          ),
                        ],
                      ),
                    );
                  }

                  final items = (state as SocialLoaded).items;

                  if (items.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.article_outlined,
                              color: AppColors.textSecondary, size: 56),
                          const SizedBox(height: 16),
                          const Text(
                            '아직 게시물이 없어요',
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.textSecondary),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            '오른쪽 상단 + 버튼으로 첫 게시물을 올려보세요!',
                            style: TextStyle(
                                fontSize: 13, color: AppColors.gray),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          TextButton.icon(
                            onPressed: () async {
                              final cubit = context.read<SocialCubit>();
                              final result =
                                  await Navigator.of(context).push<bool>(
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const CreatePostScreen()),
                              );
                              if (result == true) cubit.load();
                            },
                            icon: const Icon(Icons.add,
                                color: AppColors.primaryOrange),
                            label: const Text(
                              '첫 게시물 작성',
                              style: TextStyle(
                                  color: AppColors.primaryOrange,
                                  fontWeight: FontWeight.w700),
                            ),
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
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                      itemCount: items.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) =>
                          _FeedCard(item: items[index]),
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

    final hasRecord = item.runRecordId != null;
    final isRandom = item.mode == 'random';
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
          // ── 헤더: 아바타 + 닉네임 + 날짜 ───────────────────────
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
              if (hasRecord)
                _ModeChip(
                    label: item.mode?.toUpperCase() ?? '', color: modeColor),
            ],
          ),

          // ── 게시글 내용 ───────────────────────────────────────
          if (item.content.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              item.content,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.white,
                height: 1.5,
              ),
            ),
          ],

          // ── 첨부된 러닝 기록 ──────────────────────────────────
          if (hasRecord) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.black.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item.shapeLabel != null)
                    Text(
                      item.shapeLabel!,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  if (isRandom && item.shapeSimilarity > 0) ...[
                    const SizedBox(height: 6),
                    _SimilarityBar(score: item.shapeSimilarity),
                  ],
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _StatItem(
                          icon: Icons.straighten,
                          value:
                              '${item.distanceKm.toStringAsFixed(2)} km'),
                      const SizedBox(width: 16),
                      _StatItem(
                          icon: Icons.timer,
                          value: _formatDuration(item.durationSeconds)),
                      const SizedBox(width: 16),
                      _StatItem(icon: Icons.speed, value: item.avgPace),
                    ],
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: 14),

          // ── 좋아요 + 댓글 버튼 ───────────────────────────────
          Row(
            children: [
              // 좋아요
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
              const SizedBox(width: 20),
              // 댓글
              GestureDetector(
                onTap: () => _showComments(context, item),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.chat_bubble_outline_rounded,
                        size: 18, color: AppColors.textSecondary),
                    const SizedBox(width: 5),
                    Text(
                      '${item.commentCount}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDuration(int seconds) {
    final h = seconds ~/ 3600;
    final m = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return h > 0 ? '$h:$m:$s' : '$m:$s';
  }

  void _showComments(BuildContext context, RunFeedItem item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => _CommentsSheet(feedId: item.id),
    );
  }
}

// ── 댓글 바텀 시트 ────────────────────────────────────────────────

class _CommentsSheet extends StatefulWidget {
  final String feedId;

  const _CommentsSheet({required this.feedId});

  @override
  State<_CommentsSheet> createState() => _CommentsSheetState();
}

class _CommentsSheetState extends State<_CommentsSheet> {
  final _inputCtrl = TextEditingController();
  final _dataSource = getIt<FeedRemoteDataSource>();
  List<Comment> _comments = [];
  bool _loading = true;
  bool _sending = false;

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  @override
  void dispose() {
    _inputCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadComments() async {
    try {
      final comments = await _dataSource.getComments(widget.feedId);
      if (mounted) setState(() {
        _comments = comments;
        _loading = false;
      });
    } catch (_) {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _send() async {
    final text = _inputCtrl.text.trim();
    if (text.isEmpty || _sending) return;

    setState(() => _sending = true);
    try {
      await _dataSource.addComment(feedId: widget.feedId, content: text);
      _inputCtrl.clear();
      await _loadComments();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('댓글 전송 실패: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.65,
        child: Column(
          children: [
            // 핸들
            const SizedBox(height: 12),
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '댓글',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 12),
            const Divider(color: AppColors.border, height: 1),

            // 댓글 목록
            Expanded(
              child: _loading
                  ? const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.primaryOrange))
                  : _comments.isEmpty
                      ? const Center(
                          child: Text(
                            '첫 댓글을 남겨보세요!',
                            style: TextStyle(
                                color: AppColors.textSecondary, fontSize: 14),
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          itemCount: _comments.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 14),
                          itemBuilder: (_, i) =>
                              _CommentTile(comment: _comments[i]),
                        ),
            ),

            // 댓글 입력창
            const Divider(color: AppColors.border, height: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: AppColors.border),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: _inputCtrl,
                        style: const TextStyle(
                            color: AppColors.white, fontSize: 14),
                        decoration: const InputDecoration(
                          hintText: '댓글 입력...',
                          hintStyle: TextStyle(
                              color: AppColors.textSecondary, fontSize: 14),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 10),
                        ),
                        onSubmitted: (_) => _send(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: _send,
                    child: _sending
                        ? const SizedBox(
                            width: 36,
                            height: 36,
                            child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.primaryOrange),
                          )
                        : Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: AppColors.primaryOrange,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.send_rounded,
                                size: 18, color: AppColors.white),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CommentTile extends StatelessWidget {
  final Comment comment;

  const _CommentTile({required this.comment});

  @override
  Widget build(BuildContext context) {
    final dt = comment.createdAt;
    final dateStr =
        '${dt.month.toString().padLeft(2, '0')}.${dt.day.toString().padLeft(2, '0')} '
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.border,
          child: Icon(Icons.person_rounded,
              size: 18, color: AppColors.textSecondary),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    comment.userName,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    dateStr,
                    style: const TextStyle(
                        fontSize: 11, color: AppColors.textSecondary),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Text(
                comment.content,
                style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    height: 1.4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── 유사도 바 ─────────────────────────────────────────────────────

class _SimilarityBar extends StatelessWidget {
  final double score;

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
              fontSize: 13, fontWeight: FontWeight.w700, color: barColor),
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
        Icon(icon, size: 13, color: AppColors.textSecondary),
        const SizedBox(width: 4),
        Text(value,
            style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}
