import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

@injectable
class SignUp {
  final AuthRepository _repository;

  const SignUp(this._repository);

  Future<Either<Failure, User>> call({
    required String name,
    required String email,
    required String password,
  }) =>
      _repository.signUp(name: name, email: email, password: password);
}
