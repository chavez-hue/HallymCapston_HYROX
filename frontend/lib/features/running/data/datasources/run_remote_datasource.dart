import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../models/run_record_model.dart';

abstract interface class RunRemoteDataSource {
  Future<RunRecordModel> saveRunRecord(RunRecordModel model);

  Future<List<RunRecordModel>> getRunHistory(String userId);

  Future<RunRecordModel> getRunRecord(String recordId);
}

@LazySingleton(as: RunRemoteDataSource)
class RunRemoteDataSourceImpl implements RunRemoteDataSource {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _runsRef(String userId) =>
      _db.collection('users').doc(userId).collection('runs');

  @override
  Future<RunRecordModel> saveRunRecord(RunRecordModel model) async {
    final data = _toFirestoreMap(model);
    await _runsRef(model.userId).doc(model.id).set(data);

    // feeds 컬렉션에 덴오마이즈된 문서 추가 (소셜 피드용)
    await _writeFeed(model);

    return model;
  }

  Future<void> _writeFeed(RunRecordModel model) async {
    try {
      final userDoc =
          await _db.collection('users').doc(model.userId).get();
      final profile = userDoc.data() ?? {};
      await _db.collection('feeds').doc(model.id).set({
        'userId': model.userId,
        'userName': profile['name'] as String? ?? '익명',
        'userPhotoUrl': profile['photoUrl'] as String?,
        'mode': model.mode,
        'shapeLabel': model.shapeLabel,
        'shapeSimilarity': model.shapeSimilarity,
        'distanceKm': model.distanceKm,
        'durationSeconds': model.durationSeconds,
        'avgPace': model.avgPace,
        'createdAt': Timestamp.fromDate(model.startedAt),
        'likeCount': 0,
        'likedBy': [],
      });
    } catch (_) {
      // 피드 쓰기 실패는 러닝 저장에 영향 없음
    }
  }

  @override
  Future<List<RunRecordModel>> getRunHistory(String userId) async {
    final snapshot = await _runsRef(userId)
        .orderBy('startedAt', descending: true)
        .get();
    return snapshot.docs
        .map((doc) => _fromFirestoreMap(doc.id, doc.data()))
        .toList();
  }

  @override
  Future<RunRecordModel> getRunRecord(String recordId) {
    throw UnimplementedError('Use getRunHistory to fetch records');
  }

  // ── Firestore 직렬화 ──────────────────────────────────────────

  Map<String, dynamic> _toFirestoreMap(RunRecordModel m) => {
        'id': m.id,
        'userId': m.userId,
        'startedAt': Timestamp.fromDate(m.startedAt),
        'endedAt': Timestamp.fromDate(m.endedAt),
        'distanceKm': m.distanceKm,
        'durationSeconds': m.durationSeconds,
        'avgPace': m.avgPace,
        'shapeId': m.shapeId,
        'shapeSimilarity': m.shapeSimilarity,
        'mode': m.mode,
        'shapeLabel': m.shapeLabel,
        'route': m.route
            .map((p) => {
                  'lat': p.latitude,
                  'lng': p.longitude,
                  'ts': Timestamp.fromDate(p.timestamp),
                  if (p.altitude != null) 'alt': p.altitude,
                  if (p.accuracy != null) 'acc': p.accuracy,
                })
            .toList(),
      };

  RunRecordModel _fromFirestoreMap(String docId, Map<String, dynamic> d) {
    final rawRoute = (d['route'] as List<dynamic>? ?? []);
    final route = rawRoute.map((r) {
      final map = r as Map<String, dynamic>;
      return GpsPointModel(
        latitude: (map['lat'] as num).toDouble(),
        longitude: (map['lng'] as num).toDouble(),
        timestamp: (map['ts'] as Timestamp).toDate(),
        altitude: map['alt'] != null ? (map['alt'] as num).toDouble() : null,
        accuracy: map['acc'] != null ? (map['acc'] as num).toDouble() : null,
      );
    }).toList();

    return RunRecordModel(
      id: d['id'] as String? ?? docId,
      userId: d['userId'] as String? ?? '',
      startedAt: (d['startedAt'] as Timestamp).toDate(),
      endedAt: (d['endedAt'] as Timestamp).toDate(),
      route: route,
      distanceKm: (d['distanceKm'] as num).toDouble(),
      durationSeconds: d['durationSeconds'] as int,
      avgPace: d['avgPace'] as String? ?? "--'--\"",
      shapeId: d['shapeId'] as String?,
      shapeSimilarity: (d['shapeSimilarity'] as num?)?.toDouble() ?? 0.0,
      mode: d['mode'] as String? ?? 'random',
      shapeLabel: d['shapeLabel'] as String?,
    );
  }
}
