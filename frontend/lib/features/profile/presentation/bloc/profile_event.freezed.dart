// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadRequested,
    required TResult Function(Profile profile) updateRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadRequested,
    TResult? Function(Profile profile)? updateRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadRequested,
    TResult Function(Profile profile)? updateRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoadRequested value) loadRequested,
    required TResult Function(ProfileUpdateRequested value) updateRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoadRequested value)? loadRequested,
    TResult? Function(ProfileUpdateRequested value)? updateRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadRequested value)? loadRequested,
    TResult Function(ProfileUpdateRequested value)? updateRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
    ProfileEvent value,
    $Res Function(ProfileEvent) then,
  ) = _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProfileLoadRequestedImplCopyWith<$Res> {
  factory _$$ProfileLoadRequestedImplCopyWith(
    _$ProfileLoadRequestedImpl value,
    $Res Function(_$ProfileLoadRequestedImpl) then,
  ) = __$$ProfileLoadRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$ProfileLoadRequestedImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileLoadRequestedImpl>
    implements _$$ProfileLoadRequestedImplCopyWith<$Res> {
  __$$ProfileLoadRequestedImplCopyWithImpl(
    _$ProfileLoadRequestedImpl _value,
    $Res Function(_$ProfileLoadRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null}) {
    return _then(
      _$ProfileLoadRequestedImpl(
        null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ProfileLoadRequestedImpl implements ProfileLoadRequested {
  const _$ProfileLoadRequestedImpl(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'ProfileEvent.loadRequested(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileLoadRequestedImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileLoadRequestedImplCopyWith<_$ProfileLoadRequestedImpl>
  get copyWith =>
      __$$ProfileLoadRequestedImplCopyWithImpl<_$ProfileLoadRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadRequested,
    required TResult Function(Profile profile) updateRequested,
  }) {
    return loadRequested(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadRequested,
    TResult? Function(Profile profile)? updateRequested,
  }) {
    return loadRequested?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadRequested,
    TResult Function(Profile profile)? updateRequested,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoadRequested value) loadRequested,
    required TResult Function(ProfileUpdateRequested value) updateRequested,
  }) {
    return loadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoadRequested value)? loadRequested,
    TResult? Function(ProfileUpdateRequested value)? updateRequested,
  }) {
    return loadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadRequested value)? loadRequested,
    TResult Function(ProfileUpdateRequested value)? updateRequested,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(this);
    }
    return orElse();
  }
}

abstract class ProfileLoadRequested implements ProfileEvent {
  const factory ProfileLoadRequested(final String userId) =
      _$ProfileLoadRequestedImpl;

  String get userId;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileLoadRequestedImplCopyWith<_$ProfileLoadRequestedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileUpdateRequestedImplCopyWith<$Res> {
  factory _$$ProfileUpdateRequestedImplCopyWith(
    _$ProfileUpdateRequestedImpl value,
    $Res Function(_$ProfileUpdateRequestedImpl) then,
  ) = __$$ProfileUpdateRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Profile profile});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$ProfileUpdateRequestedImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileUpdateRequestedImpl>
    implements _$$ProfileUpdateRequestedImplCopyWith<$Res> {
  __$$ProfileUpdateRequestedImplCopyWithImpl(
    _$ProfileUpdateRequestedImpl _value,
    $Res Function(_$ProfileUpdateRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? profile = null}) {
    return _then(
      _$ProfileUpdateRequestedImpl(
        null == profile
            ? _value.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as Profile,
      ),
    );
  }

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$ProfileUpdateRequestedImpl implements ProfileUpdateRequested {
  const _$ProfileUpdateRequestedImpl(this.profile);

  @override
  final Profile profile;

  @override
  String toString() {
    return 'ProfileEvent.updateRequested(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileUpdateRequestedImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileUpdateRequestedImplCopyWith<_$ProfileUpdateRequestedImpl>
  get copyWith =>
      __$$ProfileUpdateRequestedImplCopyWithImpl<_$ProfileUpdateRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadRequested,
    required TResult Function(Profile profile) updateRequested,
  }) {
    return updateRequested(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadRequested,
    TResult? Function(Profile profile)? updateRequested,
  }) {
    return updateRequested?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadRequested,
    TResult Function(Profile profile)? updateRequested,
    required TResult orElse(),
  }) {
    if (updateRequested != null) {
      return updateRequested(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoadRequested value) loadRequested,
    required TResult Function(ProfileUpdateRequested value) updateRequested,
  }) {
    return updateRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoadRequested value)? loadRequested,
    TResult? Function(ProfileUpdateRequested value)? updateRequested,
  }) {
    return updateRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadRequested value)? loadRequested,
    TResult Function(ProfileUpdateRequested value)? updateRequested,
    required TResult orElse(),
  }) {
    if (updateRequested != null) {
      return updateRequested(this);
    }
    return orElse();
  }
}

abstract class ProfileUpdateRequested implements ProfileEvent {
  const factory ProfileUpdateRequested(final Profile profile) =
      _$ProfileUpdateRequestedImpl;

  Profile get profile;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileUpdateRequestedImplCopyWith<_$ProfileUpdateRequestedImpl>
  get copyWith => throw _privateConstructorUsedError;
}
