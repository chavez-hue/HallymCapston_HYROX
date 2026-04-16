import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:injectable/injectable.dart';

import '../../domain/entities/comment.dart';
import '../../domain/entities/run_feed_item.dart';
import '../models/feed_model.dart';

abstract interface class FeedRemoteDataSource {
  // ── 레거시 (미사용) ──────────────────────────────────────────────
  Future<List<FeedModel>> getFeed({int limit = 20});
  Future<FeedModel> postFeed({
    required String userId,
    required String content,
    String? runRecordId,
  });
  Future<void> likeFeed(String feedId);
  Future<void> unlikeFeed(String feedId);

  // ── 피드 ────────────────────────────────────────────────────────
  Future<List<RunFeedItem>> getRunFeed({int limit, String currentUserId});
  Future<void> postRunFeed({
    required String content,
    String? runRecordId,
    String? mode,
    String? shapeLabel,
    double shapeSimilarity,
    double distanceKm,
    int durationSeconds,
    String avgPace,
  });
  Future<void> toggleLike({
    required String feedId,
    required String userId,
    required bool currentlyLiked,
  });

  // ── 댓글 ────────────────────────────────────────────────────────
  Future<List<Comment>> getComments(String feedId);
  Future<void> addComment({required String feedId, required String content});
}

@LazySingleton(as: FeedRemoteDataSource)
class FeedRemoteDataSourceImpl implements FeedRemoteDataSource {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<List<FeedModel>> getFeed({int limit = 20}) =>
      throw UnimplementedError();
  @override
  Future<FeedModel> postFeed(
          {required String userId,
          required String content,
          String? runRecordId}) =>
      throw UnimplementedError();
  @override
  Future<void> likeFeed(String feedId) => throw UnimplementedError();
  @override
  Future<void> unlikeFeed(String feedId) => throw UnimplementedError();

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

    return snap.docs.map<RunFeedItem>((doc) {
      final d = doc.data();
      final likedBy = (d['likedBy'] as List<dynamic>? ?? [])
          .map((e) => e as String)
          .toList();
      return RunFeedItem(
        id: doc.id,
        userId: d['userId'] as String? ?? '',
        userName: d['userName'] as String? ?? '익명',
        userPhotoUrl: d['userPhotoUrl'] as String?,
        content: d['content'] as String? ?? '',
        runRecordId: d['runRecordId'] as String?,
        mode: d['mode'] as String?,
        shapeLabel: d['shapeLabel'] as String?,
        shapeSimilarity: (d['shapeSimilarity'] as num?)?.toDouble() ?? 0.0,
        distanceKm: (d['distanceKm'] as num?)?.toDouble() ?? 0.0,
        durationSeconds: (d['durationSeconds'] as num?)?.toInt() ?? 0,
        avgPace: d['avgPace'] as String? ?? "--'--\"",
        createdAt: (d['createdAt'] as Timestamp).toDate(),
        likeCount: (d['likeCount'] as num?)?.toInt() ?? 0,
        isLikedByMe:
            currentUserId.isNotEmpty && likedBy.contains(currentUserId),
        commentCount: (d['commentCount'] as num?)?.toInt() ?? 0,
      );
    }).toList();
  }

  @override
  Future<void> postRunFeed({
    required String content,
    String? runRecordId,
    String? mode,
    String? shapeLabel,
    double shapeSimilarity = 0.0,
    double distanceKm = 0.0,
    int durationSeconds = 0,
    String avgPace = "--'--\"",
  }) async {
    final fbUser = fb.FirebaseAuth.instance.currentUser;
    if (fbUser == null) throw Exception('로그인이 필요합니다.');

    String userName = '';
    String? userPhotoUrl = fbUser.photoURL;

    try {
      final profileDoc = await _db.collection('users').doc(fbUser.uid).get();
      final profile = profileDoc.data() ?? {};
      userName = (profile['name'] as String?)?.trim() ?? '';
      userPhotoUrl ??= profile['photoUrl'] as String?;
    } catch (_) {}

    if (userName.isEmpty) {
      userName = fbUser.displayName?.trim() ?? '';
    }

    await _db.collection('feeds').doc().set({
      'userId': fbUser.uid,
      'userName': userName,
      'userPhotoUrl': userPhotoUrl,
      'content': content,
      'runRecordId': runRecordId,
      'mode': mode,
      'shapeLabel': shapeLabel,
      'shapeSimilarity': shapeSimilarity,
      'distanceKm': distanceKm,
      'durationSeconds': durationSeconds,
      'avgPace': avgPace,
      'createdAt': FieldValue.serverTimestamp(),
      'likeCount': 0,
      'likedBy': [],
      'commentCount': 0,
    });
  }

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

  @override
  Future<List<Comment>> getComments(String feedId) async {
    final snap = await _db
        .collection('feeds')
        .doc(feedId)
        .collection('comments')
        .orderBy('createdAt')
        .get();

    return snap.docs.map<Comment>((doc) {
      final d = doc.data();
      return Comment(
        id: doc.id,
        userId: d['userId'] as String? ?? '',
        userName: d['userName'] as String? ?? '익명',
        content: d['content'] as String? ?? '',
        createdAt: (d['createdAt'] as Timestamp).toDate(),
      );
    }).toList();
  }

  @override
  Future<void> addComment({
    required String feedId,
    required String content,
  }) async {
    final fbUser = fb.FirebaseAuth.instance.currentUser;
    if (fbUser == null) throw Exception('로그인이 필요합니다.');

    String userName = '';
    try {
      final profileDoc = await _db.collection('users').doc(fbUser.uid).get();
      userName = (profileDoc.data()?['name'] as String?)?.trim() ?? '';
    } catch (_) {}

    if (userName.isEmpty) {
      userName = fbUser.displayName?.trim() ?? '';
    }

    final feedRef = _db.collection('feeds').doc(feedId);
    final commentRef = feedRef.collection('comments').doc();

    final batch = _db.batch();
    batch.set(commentRef, {
      'userId': fbUser.uid,
      'userName': userName,
      'content': content,
      'createdAt': FieldValue.serverTimestamp(),
    });
    batch.update(feedRef, {'commentCount': FieldValue.increment(1)});
    await batch.commit();
  }
}
