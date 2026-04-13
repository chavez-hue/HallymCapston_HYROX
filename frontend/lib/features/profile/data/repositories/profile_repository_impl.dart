import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';
import '../models/profile_model.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remote;

  const ProfileRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, Profile>> getProfile(String userId) async {
    try {
      final model = await _remote.getProfile(userId);
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Profile>> updateProfile(Profile profile) async {
    try {
      final model = ProfileModel(
        id: profile.id,
        name: profile.name,
        email: profile.email,
        photoUrl: profile.photoUrl,
        puzzleCount: profile.puzzleCount,
        totalDistanceKm: profile.totalDistanceKm,
        bestPace: profile.bestPace,
        totalRunTime: profile.totalRunTime,
        level: profile.level,
        completedShapeIds: profile.completedShapeIds,
      );
      final updated = await _remote.updateProfile(model);
      return Right(updated.toEntity());
    } catch (e) {
      return Left(Failure.server(e.toString()));
    }
  }
}
