import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_model.dart';

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
      return Left(Failure.auth(e.toString()));
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
