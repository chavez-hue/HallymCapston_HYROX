import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

@injectable
class UpdateProfile {
  final ProfileRepository _repository;

  const UpdateProfile(this._repository);

  Future<Either<Failure, Profile>> call(Profile profile) =>
      _repository.updateProfile(profile);
}
