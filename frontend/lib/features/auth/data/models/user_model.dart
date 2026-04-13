import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    required String name,
    String? photoUrl,
    @Default(0) int puzzleCount,
    @Default('') String avgPace,
    @Default('') String totalRunTime,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  User toEntity() => User(
        id: id,
        email: email,
        name: name,
        photoUrl: photoUrl,
        puzzleCount: puzzleCount,
        avgPace: avgPace,
        totalRunTime: totalRunTime,
      );
}
