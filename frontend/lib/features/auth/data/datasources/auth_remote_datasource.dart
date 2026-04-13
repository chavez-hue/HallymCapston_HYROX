import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:injectable/injectable.dart';

import '../models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signIn({required String email, required String password});
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<void> signOut();
  Future<UserModel?> getCurrentUser();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final fb.FirebaseAuth _auth = fb.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final fbUser = credential.user!;

    final doc = await _firestore.collection('users').doc(fbUser.uid).get();
    if (doc.exists) {
      return UserModel.fromJson({'id': fbUser.uid, ...doc.data()!});
    }

    return UserModel(
      id: fbUser.uid,
      email: fbUser.email ?? '',
      name: fbUser.displayName ?? '',
    );
  }

  @override
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final fbUser = credential.user!;

    await fbUser.updateDisplayName(name);

    final model = UserModel(
      id: fbUser.uid,
      email: email,
      name: name,
    );

    await _firestore
        .collection('users')
        .doc(fbUser.uid)
        .set(model.toJson()..remove('id'));

    return model;
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final fbUser = _auth.currentUser;
    if (fbUser == null) return null;

    final doc = await _firestore.collection('users').doc(fbUser.uid).get();
    if (doc.exists) {
      return UserModel.fromJson({'id': fbUser.uid, ...doc.data()!});
    }

    return UserModel(
      id: fbUser.uid,
      email: fbUser.email ?? '',
      name: fbUser.displayName ?? '',
    );
  }
}
