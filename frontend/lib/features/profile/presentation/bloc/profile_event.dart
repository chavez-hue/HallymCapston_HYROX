import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/profile.dart';

part 'profile_event.freezed.dart';

@freezed
sealed class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.loadRequested(String userId) = ProfileLoadRequested;

  const factory ProfileEvent.updateRequested(Profile profile) =
      ProfileUpdateRequested;
}
