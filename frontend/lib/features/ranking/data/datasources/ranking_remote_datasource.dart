import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../models/ranking_model.dart';

abstract interface class RankingRemoteDataSource {
  /// 전체 랭킹 (puzzleCount 기준 내림차순, 최대 [limit]명).
  /// [currentUserId] 가 top [limit] 밖이면 마지막 원소로 추가해 반환.
  Future<List<RankingModel>> getGlobalRanking({
    int limit = 50,
    String currentUserId = '',
  });

  /// 특정 유저의 puzzleCount 조회 (내 런 subcollection만 사용).
  Future<RankingModel> getMyRanking(String userId);
}

@LazySingleton(as: RankingRemoteDataSource)
class RankingRemoteDataSourceImpl implements RankingRemoteDataSource {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ── 전체 랭킹 ──────────────────────────────────────────────────
  //
  // collection group 쿼리 없이 동작:
  //   1. users 컬렉션 전체 문서 조회 (프로필)
  //   2. 각 유저의 runs 서브컬렉션을 Future.wait 으로 병렬 조회
  //      where('mode', == 'random') — 단일 필드 쿼리 → 인덱스 불필요
  //   3. 클라이언트에서 shapeSimilarity >= 70 필터 → 집계
  //   4. 내림차순 정렬 후 limit 잘라내기
  @override
  Future<List<RankingModel>> getGlobalRanking({
    int limit = 50,
    String currentUserId = '',
  }) async {
    // 1. 전체 유저 프로필 조회
    final usersSnap = await _db.collection('users').get();

    // 2. 각 유저의 랜덤 런 통과 횟수 병렬 집계
    final futures = usersSnap.docs.map((userDoc) async {
      final uid = userDoc.id;
      final profile = userDoc.data();

      final runsSnap = await _db
          .collection('users')
          .doc(uid)
          .collection('runs')
          .where('mode', isEqualTo: 'random')
          .get();

      final count = runsSnap.docs.where((doc) {
        final similarity =
            (doc.data()['shapeSimilarity'] as num?)?.toDouble() ?? 0.0;
        return similarity >= 70.0;
      }).length;

      return _UserCount(uid: uid, profile: profile, count: count);
    });

    final userCounts = await Future.wait(futures);

    // 3. 내림차순 정렬
    userCounts.sort((a, b) => b.count.compareTo(a.count));

    // 4. top N 선택 & 내 유저 top N 포함 여부 확인
    final topList = userCounts.take(limit).toList();
    final myInTop = currentUserId.isNotEmpty &&
        topList.any((e) => e.uid == currentUserId);

    // 5. 결과 구성
    final results = <RankingModel>[];
    for (int i = 0; i < topList.length; i++) {
      final e = topList[i];
      results.add(_toModel(rank: i + 1, entry: e));
    }

    // 6. currentUser 가 top N 밖이면 실제 순위와 함께 마지막에 추가
    if (!myInTop && currentUserId.isNotEmpty) {
      final myIdx = userCounts.indexWhere((e) => e.uid == currentUserId);
      if (myIdx >= 0) {
        results.add(_toModel(rank: myIdx + 1, entry: userCounts[myIdx]));
      }
    }

    return results;
  }

  // ── 내 랭킹 조회 ────────────────────────────────────────────────
  @override
  Future<RankingModel> getMyRanking(String userId) async {
    final runsSnap = await _db
        .collection('users')
        .doc(userId)
        .collection('runs')
        .where('mode', isEqualTo: 'random')
        .get();

    final count = runsSnap.docs.where((doc) {
      final similarity =
          (doc.data()['shapeSimilarity'] as num?)?.toDouble() ?? 0.0;
      return similarity >= 70.0;
    }).length;

    final profile = await _fetchProfile(userId);

    return RankingModel(
      rank: -1, // 정확한 순위는 bloc 에서 결정
      userId: userId,
      userName: profile['name'] as String? ?? '나',
      userPhotoUrl: profile['photoUrl'] as String?,
      puzzleCount: count,
      totalDistanceKm: 0.0,
      bestPace: "--'--\"",
    );
  }

  // ── 헬퍼 ────────────────────────────────────────────────────────

  RankingModel _toModel({required int rank, required _UserCount entry}) {
    return RankingModel(
      rank: rank,
      userId: entry.uid,
      userName: entry.profile['name'] as String? ?? '익명',
      userPhotoUrl: entry.profile['photoUrl'] as String?,
      puzzleCount: entry.count,
      totalDistanceKm: 0.0,
      bestPace: "--'--\"",
    );
  }

  Future<Map<String, dynamic>> _fetchProfile(String userId) async {
    try {
      final doc = await _db.collection('users').doc(userId).get();
      return doc.data() ?? {};
    } catch (_) {
      return {};
    }
  }
}

// ── 내부 집계용 레코드 ────────────────────────────────────────────
class _UserCount {
  final String uid;
  final Map<String, dynamic> profile;
  final int count;

  const _UserCount({
    required this.uid,
    required this.profile,
    required this.count,
  });
}
