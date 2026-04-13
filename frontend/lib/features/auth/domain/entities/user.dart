import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String name,
    String? photoUrl,
    @Default(0) int puzzleCount,
    @Default('') String avgPace,
    @Default('') String totalRunTime,
  }) = _User;
}
