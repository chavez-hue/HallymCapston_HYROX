import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_model.dart';

String _authErrorMessage(Object e) {
  if (e is fb.FirebaseAuthException) {
    switch (e.code) {
      case 'invalid-credential':
        return '이메일 또는 비밀번호가 올바르지 않습니다';
      case 'user-not-found':
        return '등록되지 않은 이메일입니다';
      case 'wrong-password':
        return '비밀번호가 올바르지 않습니다';
      case 'too-many-requests':
        return '로그인 시도가 너무 많습니다. 잠시 후 다시 시도해주세요';
      case 'network-request-failed':
        return '네트워크 연결을 확인해주세요';
      default:
        return '로그인에 실패했습니다. 다시 시도해주세요';
    }
  }
  return '로그인에 실패했습니다. 다시 시도해주세요';
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remote;

  const AuthRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final model = await _remote.signIn(email: email, password: password);
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.auth(_authErrorMessage(e)));
    }
  }

  @override
  Future<Either<Failure, User>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final model = await _remote.signUp(
        name: name,
        email: email,
        password: password,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.auth(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await _remote.signOut();
      return const Right(unit);
    } catch (e) {
      return Left(Failure.auth(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final model = await _remote.getCurrentUser();
      return Right(model?.toEntity());
    } catch (e) {
      return Left(Failure.auth(e.toString()));
    }
  }
}
