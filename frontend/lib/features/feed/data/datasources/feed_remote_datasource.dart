import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/run_feed_item.dart';
import '../models/feed_model.dart';

abstract interface class FeedRemoteDataSource {
  Future<List<FeedModel>> getFeed({int limit = 20});

  Future<FeedModel> postFeed({
    required String userId,
    required String content,
    String? runRecordId,
  });

  Future<void> likeFeed(String feedId);

  Future<void> unlikeFeed(String feedId);

  /// feeds 컬렉션에서 최신순으로 러닝 피드를 가져옴.
  /// [currentUserId]로 좋아요 여부 판단.
  Future<List<RunFeedItem>> getRunFeed({
    int limit = 30,
    String currentUserId = '',
  });

  /// 좋아요 토글: arrayUnion/Remove + increment 원자 업데이트.
  Future<void> toggleLike({
    required String feedId,
    required String userId,
    required bool currentlyLiked,
  });
}

@LazySingleton(as: FeedRemoteDataSource)
class FeedRemoteDataSourceImpl implements FeedRemoteDataSource {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ── 레거시 (미사용) ──────────────────────────────────────────────

  @override
  Future<List<FeedModel>> getFeed({int limit = 20}) {
    throw UnimplementedError('getFeed not implemented');
  }

  @override
  Future<FeedModel> postFeed({
    required String userId,
    required String content,
    String? runRecordId,
  }) {
    throw UnimplementedError('postFeed not implemented');
  }

  @override
  Future<void> likeFeed(String feedId) {
    throw UnimplementedError('likeFeed not implemented');
  }

  @override
  Future<void> unlikeFeed(String feedId) {
    throw UnimplementedError('unlikeFeed not implemented');
  }

  // ── 러닝 피드 ────────────────────────────────────────────────────

  @override
  Future<List<RunFeedItem>> getRunFeed({
    int limit = 30,
    String currentUserId = '',
  }) async {
    final snap = await _db
        .collection('feeds')
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .get();

    return snap.docs.map((doc) {
      final d = doc.data();
      final likedBy = (d['likedBy'] as List<dynamic>? ?? [])
          .map((e) => e as String)
          .toList();

      return RunFeedItem(
        id: doc.id,
        userId: d['userId'] as String? ?? '',
        userName: d['userName'] as String? ?? '익명',
        userPhotoUrl: d['userPhotoUrl'] as String?,
        mode: d['mode'] as String? ?? 'random',
        shapeLabel: d['shapeLabel'] as String?,
        shapeSimilarity: (d['shapeSimilarity'] as num?)?.toDouble() ?? 0.0,
        distanceKm: (d['distanceKm'] as num?)?.toDouble() ?? 0.0,
        durationSeconds: d['durationSeconds'] as int? ?? 0,
        avgPace: d['avgPace'] as String? ?? "--'--\"",
        createdAt: (d['createdAt'] as Timestamp).toDate(),
        likeCount: d['likeCount'] as int? ?? 0,
        isLikedByMe: currentUserId.isNotEmpty && likedBy.contains(currentUserId),
      );
    }).toList();
  }

  // ── 좋아요 토글 ──────────────────────────────────────────────────

  @override
  Future<void> toggleLike({
    required String feedId,
    required String userId,
    required bool currentlyLiked,
  }) async {
    final ref = _db.collection('feeds').doc(feedId);
    if (currentlyLiked) {
      await ref.update({
        'likedBy': FieldValue.arrayRemove([userId]),
        'likeCount': FieldValue.increment(-1),
      });
    } else {
      await ref.update({
        'likedBy': FieldValue.arrayUnion([userId]),
        'likeCount': FieldValue.increment(1),
      });
    }
  }
}
