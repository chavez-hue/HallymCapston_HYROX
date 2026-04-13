import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_profile.dart';
import '../../domain/usecases/update_profile.dart';
import 'profile_event.dart';
import 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfile _getProfile;
  final UpdateProfile _updateProfile;

  ProfileBloc(this._getProfile, this._updateProfile)
      : super(const ProfileState.initial()) {
    on<ProfileLoadRequested>(_onLoadRequested);
    on<ProfileUpdateRequested>(_onUpdateRequested);
  }

  Future<void> _onLoadRequested(
    ProfileLoadRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    final result = await _getProfile(event.userId);
    result.fold(
      (f) => emit(ProfileState.error(f.toString())),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }

  Future<void> _onUpdateRequested(
    ProfileUpdateRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    final result = await _updateProfile(event.profile);
    result.fold(
      (f) => emit(ProfileState.error(f.toString())),
      (profile) => emit(ProfileState.loaded(profile)),
    );
  }
}
