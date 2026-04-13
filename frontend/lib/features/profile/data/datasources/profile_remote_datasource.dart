import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:injectable/injectable.dart';

import '../models/profile_model.dart';

abstract interface class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile(String userId);

  Future<ProfileModel> updateProfile(ProfileModel model);
}

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final fb.FirebaseAuth _auth = fb.FirebaseAuth.instance;

  @override
  Future<ProfileModel> getProfile(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();

    if (doc.exists) {
      final data = doc.data()!;
      return ProfileModel(
        id: userId,
        name: data['name'] as String? ?? '',
        email: data['email'] as String? ?? '',
        photoUrl: data['photoUrl'] as String?,
        puzzleCount: (data['puzzleCount'] as num?)?.toInt() ?? 0,
        bestPace: data['avgPace'] as String? ?? '',
        totalRunTime: data['totalRunTime'] as String? ?? '',
      );
    }

    // Firestore 문서가 없으면 FirebaseAuth 정보로 fallback
    final fbUser = _auth.currentUser;
    return ProfileModel(
      id: userId,
      name: fbUser?.displayName ?? '',
      email: fbUser?.email ?? '',
      photoUrl: fbUser?.photoURL,
    );
  }

  @override
  Future<ProfileModel> updateProfile(ProfileModel model) async {
    await _firestore.collection('users').doc(model.id).update({
      'name': model.name,
      'photoUrl': model.photoUrl,
      'puzzleCount': model.puzzleCount,
      'avgPace': model.bestPace,
      'totalRunTime': model.totalRunTime,
    });
    return model;
  }
}
