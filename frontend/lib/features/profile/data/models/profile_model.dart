import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/profile.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String id,
    required String name,
    required String email,
    String? photoUrl,
    @Default(0) int puzzleCount,
    @Default(0.0) double totalDistanceKm,
    @Default('') String bestPace,
    @Default('') String totalRunTime,
    @Default('Beginner') String level,
    @Default([]) List<String> completedShapeIds,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

extension ProfileModelX on ProfileModel {
  Profile toEntity() => Profile(
        id: id,
        name: name,
        email: email,
        photoUrl: photoUrl,
        puzzleCount: puzzleCount,
        totalDistanceKm: totalDistanceKm,
        bestPace: bestPace,
        totalRunTime: totalRunTime,
        level: level,
        completedShapeIds: completedShapeIds,
      );
}
