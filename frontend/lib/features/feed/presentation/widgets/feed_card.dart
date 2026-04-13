import 'package:flutter/material.dart';

import '../../../../../constants/app_colors.dart';
import '../../domain/entities/feed_item.dart';

class FeedCard extends StatelessWidget {
  final FeedItem item;

  const FeedCard({super.key, required this.item});

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
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.lightGray,
                backgroundImage: item.userPhotoUrl != null
                    ? NetworkImage(item.userPhotoUrl!)
                    : null,
                child: item.userPhotoUrl == null
                    ? const Icon(Icons.person, color: AppColors.black)
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.userName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      _timeAgo(item.createdAt),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                item.isLikedByMe
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                color: item.isLikedByMe
                    ? AppColors.primaryOrange
                    : AppColors.black,
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            item.content,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '${item.likeCount} likes',
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.gray,
            ),
          ),
        ],
      ),
    );
  }

  String _timeAgo(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 1) return 'just now';
    if (diff.inHours < 1) return '${diff.inMinutes}m ago';
    if (diff.inDays < 1) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}
