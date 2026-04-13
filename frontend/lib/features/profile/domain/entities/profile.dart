import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
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
  }) = _Profile;
}
