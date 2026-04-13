import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signInRequested({
    required String email,
    required String password,
  }) = SignInRequested;

  const factory AuthEvent.signUpRequested({
    required String name,
    required String email,
    required String password,
  }) = SignUpRequested;

  const factory AuthEvent.signOutRequested() = SignOutRequested;

  const factory AuthEvent.authCheckRequested() = AuthCheckRequested;
}
