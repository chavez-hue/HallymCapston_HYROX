// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shape_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ShapeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ShapeMission> missions) missionsLoaded,
    required TResult Function(ShapeMission mission) missionSelected,
    required TResult Function(ShapeResult result) analysisResult,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ShapeMission> missions)? missionsLoaded,
    TResult? Function(ShapeMission mission)? missionSelected,
    TResult? Function(ShapeResult result)? analysisResult,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ShapeMission> missions)? missionsLoaded,
    TResult Function(ShapeMission mission)? missionSelected,
    TResult Function(ShapeResult result)? analysisResult,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShapeInitial value) initial,
    required TResult Function(ShapeLoading value) loading,
    required TResult Function(MissionsLoaded value) missionsLoaded,
    required TResult Function(ShapeMissionSelected value) missionSelected,
    required TResult Function(ShapeAnalysisResult value) analysisResult,
    required TResult Function(ShapeError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShapeInitial value)? initial,
    TResult? Function(ShapeLoading value)? loading,
    TResult? Function(MissionsLoaded value)? missionsLoaded,
    TResult? Function(ShapeMissionSelected value)? missionSelected,
    TResult? Function(ShapeAnalysisResult value)? analysisResult,
    TResult? Function(ShapeError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShapeInitial value)? initial,
    TResult Function(ShapeLoading value)? loading,
    TResult Function(MissionsLoaded value)? missionsLoaded,
    TResult Function(ShapeMissionSelected value)? missionSelected,
    TResult Function(ShapeAnalysisResult value)? analysisResult,
    TResult Function(ShapeError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShapeStateCopyWith<$Res> {
  factory $ShapeStateCopyWith(
    ShapeState value,
    $Res Function(ShapeState) then,
  ) = _$ShapeStateCopyWithImpl<$Res, ShapeState>;
}

/// @nodoc
class _$ShapeStateCopyWithImpl<$Res, $Val extends ShapeState>
    implements $ShapeStateCopyWith<$Res> {
  _$ShapeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShapeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ShapeInitialImplCopyWith<$Res> {
  factory _$$ShapeInitialImplCopyWith(
    _$ShapeInitialImpl value,
    $Res Function(_$ShapeInitialImpl) then,
  ) = __$$ShapeInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShapeInitialImplCopyWithImpl<$Res>
    extends _$ShapeStateCopyWithImpl<$Res, _$ShapeInitialImpl>
    implements _$$ShapeInitialImplCopyWith<$Res> {
  __$$ShapeInitialImplCopyWithImpl(
    _$ShapeInitialImpl _value,
    $Res Function(_$ShapeInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShapeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ShapeInitialImpl implements ShapeInitial {
  const _$ShapeInitialImpl();

  @override
  String toString() {
    return 'ShapeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShapeInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ShapeMission> missions) missionsLoaded,
    required TResult Function(ShapeMission mission) missionSelected,
    required TResult Function(ShapeResult result) analysisResult,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ShapeMission> missions)? missionsLoaded,
    TResult? Function(ShapeMission mission)? missionSelected,
    TResult? Function(ShapeResult result)? analysisResult,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ShapeMission> missions)? missionsLoaded,
    TResult Function(ShapeMission mission)? missionSelected,
    TResult Function(ShapeResult result)? analysisResult,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShapeInitial value) initial,
    required TResult Function(ShapeLoading value) loading,
    required TResult Function(MissionsLoaded value) missionsLoaded,
    required TResult Function(ShapeMissionSelected value) missionSelected,
    required TResult Function(ShapeAnalysisResult value) analysisResult,
    required TResult Function(ShapeError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShapeInitial value)? initial,
    TResult? Function(ShapeLoading value)? loading,
    TResult? Function(MissionsLoaded value)? missionsLoaded,
    TResult? Function(ShapeMissionSelected value)? missionSelected,
    TResult? Function(ShapeAnalysisResult value)? analysisResult,
    TResult? Function(ShapeError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShapeInitial value)? initial,
    TResult Function(ShapeLoading value)? loading,
    TResult Function(MissionsLoaded value)? missionsLoaded,
    TResult Function(ShapeMissionSelected value)? missionSelected,
    TResult Function(ShapeAnalysisResult value)? analysisResult,
    TResult Function(ShapeError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ShapeInitial implements ShapeState {
  const factory ShapeInitial() = _$ShapeInitialImpl;
}

/// @nodoc
abstract class _$$ShapeLoadingImplCopyWith<$Res> {
  factory _$$ShapeLoadingImplCopyWith(
    _$ShapeLoadingImpl value,
    $Res Function(_$ShapeLoadingImpl) then,
  ) = __$$ShapeLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShapeLoadingImplCopyWithImpl<$Res>
    extends _$ShapeStateCopyWithImpl<$Res, _$ShapeLoadingImpl>
    implements _$$ShapeLoadingImplCopyWith<$Res> {
  __$$ShapeLoadingImplCopyWithImpl(
    _$ShapeLoadingImpl _value,
    $Res Function(_$ShapeLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShapeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ShapeLoadingImpl implements ShapeLoading {
  const _$ShapeLoadingImpl();

  @override
  String toString() {
    return 'ShapeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShapeLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ShapeMission> missions) missionsLoaded,
    required TResult Function(ShapeMission mission) missionSelected,
    required TResult Function(ShapeResult result) analysisResult,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ShapeMission> missions)? missionsLoaded,
    TResult? Function(ShapeMission mission)? missionSelected,
    TResult? Function(ShapeResult result)? analysisResult,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ShapeMission> missions)? missionsLoaded,
    TResult Function(ShapeMission mission)? missionSelected,
    TResult Function(ShapeResult result)? analysisResult,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShapeInitial value) initial,
    required TResult Function(ShapeLoading value) loading,
    required TResult Function(MissionsLoaded value) missionsLoaded,
    required TResult Function(ShapeMissionSelected value) missionSelected,
    required TResult Function(ShapeAnalysisResult value) analysisResult,
    required TResult Function(ShapeError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShapeInitial value)? initial,
    TResult? Function(ShapeLoading value)? loading,
    TResult? Function(MissionsLoaded value)? missionsLoaded,
    TResult? Function(ShapeMissionSelected value)? missionSelected,
    TResult? Function(ShapeAnalysisResult value)? analysisResult,
    TResult? Function(ShapeError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShapeInitial value)? initial,
    TResult Function(ShapeLoading value)? loading,
    TResult Function(MissionsLoaded value)? missionsLoaded,
    TResult Function(ShapeMissionSelected value)? missionSelected,
    TResult Function(ShapeAnalysisResult value)? analysisResult,
    TResult Function(ShapeError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ShapeLoading implements ShapeState {
  const factory ShapeLoading() = _$ShapeLoadingImpl;
}

/// @nodoc
abstract class _$$MissionsLoadedImplCopyWith<$Res> {
  factory _$$MissionsLoadedImplCopyWith(
    _$MissionsLoadedImpl value,
    $Res Function(_$MissionsLoadedImpl) then,
  ) = __$$MissionsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ShapeMission> missions});
}

/// @nodoc
class __$$MissionsLoadedImplCopyWithImpl<$Res>
    extends _$ShapeStateCopyWithImpl<$Res, _$MissionsLoadedImpl>
    implements _$$MissionsLoadedImplCopyWith<$Res> {
  __$$MissionsLoadedImplCopyWithImpl(
    _$MissionsLoadedImpl _value,
    $Res Function(_$MissionsLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShapeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? missions = null}) {
    return _then(
      _$MissionsLoadedImpl(
        null == missions
            ? _value._missions
            : missions // ignore: cast_nullable_to_non_nullable
                  as List<ShapeMission>,
      ),
    );
  }
}

/// @nodoc

class _$MissionsLoadedImpl implements MissionsLoaded {
  const _$MissionsLoadedImpl(final List<ShapeMission> missions)
    : _missions = missions;

  final List<ShapeMission> _missions;
  @override
  List<ShapeMission> get missions {
    if (_missions is EqualUnmodifiableListView) return _missions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_missions);
  }

  @override
  String toString() {
    return 'ShapeState.missionsLoaded(missions: $missions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissionsLoadedImpl &&
            const DeepCollectionEquality().equals(other._missions, _missions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_missions));

  /// Create a copy of ShapeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MissionsLoadedImplCopyWith<_$MissionsLoadedImpl> get copyWith =>
      __$$MissionsLoadedImplCopyWithImpl<_$MissionsLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ShapeMission> missions) missionsLoaded,
    required TResult Function(ShapeMission mission) missionSelected,
    required TResult Function(ShapeResult result) analysisResult,
    required TResult Function(String message) error,
  }) {
    return missionsLoaded(missions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ShapeMission> missions)? missionsLoaded,
    TResult? Function(ShapeMission mission)? missionSelected,
    TResult? Function(ShapeResult result)? analysisResult,
    TResult? Function(String message)? error,
  }) {
    return missionsLoaded?.call(missions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ShapeMission> missions)? missionsLoaded,
    TResult Function(ShapeMission mission)? missionSelected,
    TResult Function(ShapeResult result)? analysisResult,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (missionsLoaded != null) {
      return missionsLoaded(missions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShapeInitial value) initial,
    required TResult Function(ShapeLoading value) loading,
    required TResult Function(MissionsLoaded value) missionsLoaded,
    required TResult Function(ShapeMissionSelected value) missionSelected,
    required TResult Function(ShapeAnalysisResult value) analysisResult,
    required TResult Function(ShapeError value) error,
  }) {
    return missionsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShapeInitial value)? initial,
    TResult? Function(ShapeLoading value)? loading,
    TResult? Function(MissionsLoaded value)? missionsLoaded,
    TResult? Function(ShapeMissionSelected value)? missionSelected,
    TResult? Function(ShapeAnalysisResult value)? analysisResult,
    TResult? Function(ShapeError value)? error,
  }) {
    return missionsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShapeInitial value)? initial,
    TResult Function(ShapeLoading value)? loading,
    TResult Function(MissionsLoaded value)? missionsLoaded,
    TResult Function(ShapeMissionSelected value)? missionSelected,
    TResult Function(ShapeAnalysisResult value)? analysisResult,
    TResult Function(ShapeError value)? error,
    required TResult orElse(),
  }) {
    if (missionsLoaded != null) {
      return missionsLoaded(this);
    }
    return orElse();
  }
}

abstract class MissionsLoaded implements ShapeState {
  const factory MissionsLoaded(final List<ShapeMission> missions) =
      _$MissionsLoadedImpl;

  List<ShapeMission> get missions;

  /// Create a copy of ShapeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MissionsLoadedImplCopyWith<_$MissionsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShapeMissionSelectedImplCopyWith<$Res> {
  factory _$$ShapeMissionSelectedImplCopyWith(
    _$ShapeMissionSelectedImpl value,
    $Res Function(_$ShapeMissionSelectedImpl) then,
  ) = __$$ShapeMissionSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ShapeMission mission});

  $ShapeMissionCopyWith<$Res> get mission;
}

/// @nodoc
class __$$ShapeMissionSelectedImplCopyWithImpl<$Res>
    extends _$ShapeStateCopyWithImpl<$Res, _$ShapeMissionSelectedImpl>
    implements _$$ShapeMissionSelectedImplCopyWith<$Res> {
  __$$ShapeMissionSelectedImplCopyWithImpl(
    _$ShapeMissionSelectedImpl _value,
    $Res Function(_$ShapeMissionSelectedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShapeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mission = null}) {
    return _then(
      _$ShapeMissionSelectedImpl(
        null == mission
            ? _value.mission
            : mission // ignore: cast_nullable_to_non_nullable
                  as ShapeMission,
      ),
    );
  }

  /// Create a copy of ShapeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShapeMissionCopyWith<$Res> get mission {
    return $ShapeMissionCopyWith<$Res>(_value.mission, (value) {
      return _then(_value.copyWith(mission: value));
    });
  }
}

/// @nodoc

class _$ShapeMissionSelectedImpl implements ShapeMissionSelected {
  const _$ShapeMissionSelectedImpl(this.mission);

  @override
  final ShapeMission mission;

  @override
  String toString() {
    return 'ShapeState.missionSelected(mission: $mission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShapeMissionSelectedImpl &&
            (identical(other.mission, mission) || other.mission == mission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mission);

  /// Create a copy of ShapeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShapeMissionSelectedImplCopyWith<_$ShapeMissionSelectedImpl>
  get copyWith =>
      __$$ShapeMissionSelectedImplCopyWithImpl<_$ShapeMissionSelectedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ShapeMission> missions) missionsLoaded,
    required TResult Function(ShapeMission mission) missionSelected,
    required TResult Function(ShapeResult result) analysisResult,
    required TResult Function(String message) error,
  }) {
    return missionSelected(mission);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ShapeMission> missions)? missionsLoaded,
    TResult? Function(ShapeMission mission)? missionSelected,
    TResult? Function(ShapeResult result)? analysisResult,
    TResult? Function(String message)? error,
  }) {
    return missionSelected?.call(mission);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ShapeMission> missions)? missionsLoaded,
    TResult Function(ShapeMission mission)? missionSelected,
    TResult Function(ShapeResult result)? analysisResult,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (missionSelected != null) {
      return missionSelected(mission);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShapeInitial value) initial,
    required TResult Function(ShapeLoading value) loading,
    required TResult Function(MissionsLoaded value) missionsLoaded,
    required TResult Function(ShapeMissionSelected value) missionSelected,
    required TResult Function(ShapeAnalysisResult value) analysisResult,
    required TResult Function(ShapeError value) error,
  }) {
    return missionSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShapeInitial value)? initial,
    TResult? Function(ShapeLoading value)? loading,
    TResult? Function(MissionsLoaded value)? missionsLoaded,
    TResult? Function(ShapeMissionSelected value)? missionSelected,
    TResult? Function(ShapeAnalysisResult value)? analysisResult,
    TResult? Function(ShapeError value)? error,
  }) {
    return missionSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShapeInitial value)? initial,
    TResult Function(ShapeLoading value)? loading,
    TResult Function(MissionsLoaded value)? missionsLoaded,
    TResult Function(ShapeMissionSelected value)? missionSelected,
    TResult Function(ShapeAnalysisResult value)? analysisResult,
    TResult Function(ShapeError value)? error,
    required TResult orElse(),
  }) {
    if (missionSelected != null) {
      return missionSelected(this);
    }
    return orElse();
  }
}

abstract class ShapeMissionSelected implements ShapeState {
  const factory ShapeMissionSelected(final ShapeMission mission) =
      _$ShapeMissionSelectedImpl;

  ShapeMission get mission;

  /// Create a copy of ShapeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShapeMissionSelectedImplCopyWith<_$ShapeMissionSelectedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShapeAnalysisResultImplCopyWith<$Res> {
  factory _$$ShapeAnalysisResultImplCopyWith(
    _$ShapeAnalysisResultImpl value,
    $Res Function(_$ShapeAnalysisResultImpl) then,
  ) = __$$ShapeAnalysisResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ShapeResult result});

  $ShapeResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$ShapeAnalysisResultImplCopyWithImpl<$Res>
    extends _$ShapeStateCopyWithImpl<$Res, _$ShapeAnalysisResultImpl>
    implements _$$ShapeAnalysisResultImplCopyWith<$Res> {
  __$$ShapeAnalysisResultImplCopyWithImpl(
    _$ShapeAnalysisResultImpl _value,
    $Res Function(_$ShapeAnalysisResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShapeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? result = null}) {
    return _then(
      _$ShapeAnalysisResultImpl(
        null == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as ShapeResult,
      ),
    );
  }

  /// Create a copy of ShapeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShapeResultCopyWith<$Res> get result {
    return $ShapeResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }
}

/// @nodoc

class _$ShapeAnalysisResultImpl implements ShapeAnalysisResult {
  const _$ShapeAnalysisResultImpl(this.result);

  @override
  final ShapeResult result;

  @override
  String toString() {
    return 'ShapeState.analysisResult(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShapeAnalysisResultImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of ShapeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShapeAnalysisResultImplCopyWith<_$ShapeAnalysisResultImpl> get copyWith =>
      __$$ShapeAnalysisResultImplCopyWithImpl<_$ShapeAnalysisResultImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ShapeMission> missions) missionsLoaded,
    required TResult Function(ShapeMission mission) missionSelected,
    required TResult Function(ShapeResult result) analysisResult,
    required TResult Function(String message) error,
  }) {
    return analysisResult(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ShapeMission> missions)? missionsLoaded,
    TResult? Function(ShapeMission mission)? missionSelected,
    TResult? Function(ShapeResult result)? analysisResult,
    TResult? Function(String message)? error,
  }) {
    return analysisResult?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ShapeMission> missions)? missionsLoaded,
    TResult Function(ShapeMission mission)? missionSelected,
    TResult Function(ShapeResult result)? analysisResult,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (analysisResult != null) {
      return analysisResult(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShapeInitial value) initial,
    required TResult Function(ShapeLoading value) loading,
    required TResult Function(MissionsLoaded value) missionsLoaded,
    required TResult Function(ShapeMissionSelected value) missionSelected,
    required TResult Function(ShapeAnalysisResult value) analysisResult,
    required TResult Function(ShapeError value) error,
  }) {
    return analysisResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShapeInitial value)? initial,
    TResult? Function(ShapeLoading value)? loading,
    TResult? Function(MissionsLoaded value)? missionsLoaded,
    TResult? Function(ShapeMissionSelected value)? missionSelected,
    TResult? Function(ShapeAnalysisResult value)? analysisResult,
    TResult? Function(ShapeError value)? error,
  }) {
    return analysisResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShapeInitial value)? initial,
    TResult Function(ShapeLoading value)? loading,
    TResult Function(MissionsLoaded value)? missionsLoaded,
    TResult Function(ShapeMissionSelected value)? missionSelected,
    TResult Function(ShapeAnalysisResult value)? analysisResult,
    TResult Function(ShapeError value)? error,
    required TResult orElse(),
  }) {
    if (analysisResult != null) {
      return analysisResult(this);
    }
    return orElse();
  }
}

abstract class ShapeAnalysisResult implements ShapeState {
  const factory ShapeAnalysisResult(final ShapeResult result) =
      _$ShapeAnalysisResultImpl;

  ShapeResult get result;

  /// Create a copy of ShapeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShapeAnalysisResultImplCopyWith<_$ShapeAnalysisResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShapeErrorImplCopyWith<$Res> {
  factory _$$ShapeErrorImplCopyWith(
    _$ShapeErrorImpl value,
    $Res Function(_$ShapeErrorImpl) then,
  ) = __$$ShapeErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ShapeErrorImplCopyWithImpl<$Res>
    extends _$ShapeStateCopyWithImpl<$Res, _$ShapeErrorImpl>
    implements _$$ShapeErrorImplCopyWith<$Res> {
  __$$ShapeErrorImplCopyWithImpl(
    _$ShapeErrorImpl _value,
    $Res Function(_$ShapeErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShapeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ShapeErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ShapeErrorImpl implements ShapeError {
  const _$ShapeErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ShapeState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShapeErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ShapeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShapeErrorImplCopyWith<_$ShapeErrorImpl> get copyWith =>
      __$$ShapeErrorImplCopyWithImpl<_$ShapeErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ShapeMission> missions) missionsLoaded,
    required TResult Function(ShapeMission mission) missionSelected,
    required TResult Function(ShapeResult result) analysisResult,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ShapeMission> missions)? missionsLoaded,
    TResult? Function(ShapeMission mission)? missionSelected,
    TResult? Function(ShapeResult result)? analysisResult,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ShapeMission> missions)? missionsLoaded,
    TResult Function(ShapeMission mission)? missionSelected,
    TResult Function(ShapeResult result)? analysisResult,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShapeInitial value) initial,
    required TResult Function(ShapeLoading value) loading,
    required TResult Function(MissionsLoaded value) missionsLoaded,
    required TResult Function(ShapeMissionSelected value) missionSelected,
    required TResult Function(ShapeAnalysisResult value) analysisResult,
    required TResult Function(ShapeError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShapeInitial value)? initial,
    TResult? Function(ShapeLoading value)? loading,
    TResult? Function(MissionsLoaded value)? missionsLoaded,
    TResult? Function(ShapeMissionSelected value)? missionSelected,
    TResult? Function(ShapeAnalysisResult value)? analysisResult,
    TResult? Function(ShapeError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShapeInitial value)? initial,
    TResult Function(ShapeLoading value)? loading,
    TResult Function(MissionsLoaded value)? missionsLoaded,
    TResult Function(ShapeMissionSelected value)? missionSelected,
    TResult Function(ShapeAnalysisResult value)? analysisResult,
    TResult Function(ShapeError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ShapeError implements ShapeState {
  const factory ShapeError(final String message) = _$ShapeErrorImpl;

  String get message;

  /// Create a copy of ShapeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShapeErrorImplCopyWith<_$ShapeErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
