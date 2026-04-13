import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../models/shape_model.dart';

abstract interface class ShapeRemoteDataSource {
  Future<List<ShapeMissionModel>> getMissions();

  Future<ShapeMissionModel> getMission(String missionId);

  Future<ShapeMissionModel> createMission(ShapeMissionModel model);

  Future<ShapeResultModel> saveResult(ShapeResultModel result);
}

@LazySingleton(as: ShapeRemoteDataSource)
class ShapeRemoteDataSourceImpl implements ShapeRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const _missionsCol = 'shapeMissions';
  static const _resultsCol = 'shapeResults';

  @override
  Future<List<ShapeMissionModel>> getMissions() async {
    final snap = await _firestore.collection(_missionsCol).get();
    return snap.docs.map((d) => _parseMission(d.id, d.data())).toList();
  }

  @override
  Future<ShapeMissionModel> getMission(String missionId) async {
    final doc =
        await _firestore.collection(_missionsCol).doc(missionId).get();
    if (!doc.exists || doc.data() == null) {
      throw Exception('Mission $missionId not found');
    }
    return _parseMission(doc.id, doc.data()!);
  }

  @override
  Future<ShapeMissionModel> createMission(ShapeMissionModel model) async {
    await _firestore.collection(_missionsCol).doc(model.id).set({
      'name': model.name,
      'type': model.type,
      'targetVertices': model.targetVertices,
      if (model.description != null) 'description': model.description,
      'difficulty': model.difficulty,
    });
    return model;
  }

  @override
  Future<ShapeResultModel> saveResult(ShapeResultModel result) async {
    await _firestore.collection(_resultsCol).add({
      'runRecordId': result.runRecordId,
      'missionId': result.missionId,
      'similarityScore': result.similarityScore,
      'isPassed': result.isPassed,
      'completedAt': result.completedAt, // Firestore가 DateTime → Timestamp 자동 변환
    });
    return result;
  }

  // ─────────────────────────────────────────────────────────────────────────
  // 파싱 헬퍼
  // ─────────────────────────────────────────────────────────────────────────

  /// Firestore 문서 데이터를 [ShapeMissionModel]로 변환.
  /// Firestore는 중첩 배열을 List<dynamic>으로 반환하므로 명시적으로 캐스팅.
  ShapeMissionModel _parseMission(String id, Map<String, dynamic> data) {
    final rawVertices = (data['targetVertices'] as List<dynamic>? ?? []);
    final targetVertices = rawVertices
        .map(
          (row) => (row as List<dynamic>)
              .map((v) => (v as num).toDouble())
              .toList(),
        )
        .toList();

    return ShapeMissionModel(
      id: id,
      name: data['name'] as String,
      type: data['type'] as String,
      targetVertices: targetVertices,
      description: data['description'] as String?,
      difficulty: (data['difficulty'] as num?)?.toInt() ?? 1,
    );
  }
}
