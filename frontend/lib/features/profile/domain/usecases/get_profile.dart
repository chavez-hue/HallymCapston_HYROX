import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

@injectable
class GetProfile {
  final ProfileRepository _repository;

  const GetProfile(this._repository);

  Future<Either<Failure, Profile>> call(String userId) =>
      _repository.getProfile(userId);
}
