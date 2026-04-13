import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

@injectable
class SignIn {
  final AuthRepository _repository;

  const SignIn(this._repository);

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  }) =>
      _repository.signIn(email: email, password: password);
}
