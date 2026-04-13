// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'running_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RunningState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )
    active,
    required TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
    )
    paused,
    required TResult Function(RunRecord record) finished,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )?
    active,
    TResult? Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
    )?
    paused,
    TResult? Function(RunRecord record)? finished,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )?
    active,
    TResult Function(List<GpsPoint> route, double distanceKm, Duration elapsed)?
    paused,
    TResult Function(RunRecord record)? finished,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RunningIdle value) idle,
    required TResult Function(RunningActive value) active,
    required TResult Function(RunningPaused value) paused,
    required TResult Function(RunningFinished value) finished,
    required TResult Function(RunningError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RunningIdle value)? idle,
    TResult? Function(RunningActive value)? active,
    TResult? Function(RunningPaused value)? paused,
    TResult? Function(RunningFinished value)? finished,
    TResult? Function(RunningError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RunningIdle value)? idle,
    TResult Function(RunningActive value)? active,
    TResult Function(RunningPaused value)? paused,
    TResult Function(RunningFinished value)? finished,
    TResult Function(RunningError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunningStateCopyWith<$Res> {
  factory $RunningStateCopyWith(
    RunningState value,
    $Res Function(RunningState) then,
  ) = _$RunningStateCopyWithImpl<$Res, RunningState>;
}

/// @nodoc
class _$RunningStateCopyWithImpl<$Res, $Val extends RunningState>
    implements $RunningStateCopyWith<$Res> {
  _$RunningStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RunningState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RunningIdleImplCopyWith<$Res> {
  factory _$$RunningIdleImplCopyWith(
    _$RunningIdleImpl value,
    $Res Function(_$RunningIdleImpl) then,
  ) = __$$RunningIdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RunningIdleImplCopyWithImpl<$Res>
    extends _$RunningStateCopyWithImpl<$Res, _$RunningIdleImpl>
    implements _$$RunningIdleImplCopyWith<$Res> {
  __$$RunningIdleImplCopyWithImpl(
    _$RunningIdleImpl _value,
    $Res Function(_$RunningIdleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RunningState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RunningIdleImpl implements RunningIdle {
  const _$RunningIdleImpl();

  @override
  String toString() {
    return 'RunningState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RunningIdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )
    active,
    required TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
    )
    paused,
    required TResult Function(RunRecord record) finished,
    required TResult Function(String message) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )?
    active,
    TResult? Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
    )?
    paused,
    TResult? Function(RunRecord record)? finished,
    TResult? Function(String message)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )?
    active,
    TResult Function(List<GpsPoint> route, double distanceKm, Duration elapsed)?
    paused,
    TResult Function(RunRecord record)? finished,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RunningIdle value) idle,
    required TResult Function(RunningActive value) active,
    required TResult Function(RunningPaused value) paused,
    required TResult Function(RunningFinished value) finished,
    required TResult Function(RunningError value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RunningIdle value)? idle,
    TResult? Function(RunningActive value)? active,
    TResult? Function(RunningPaused value)? paused,
    TResult? Function(RunningFinished value)? finished,
    TResult? Function(RunningError value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RunningIdle value)? idle,
    TResult Function(RunningActive value)? active,
    TResult Function(RunningPaused value)? paused,
    TResult Function(RunningFinished value)? finished,
    TResult Function(RunningError value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class RunningIdle implements RunningState {
  const factory RunningIdle() = _$RunningIdleImpl;
}

/// @nodoc
abstract class _$$RunningActiveImplCopyWith<$Res> {
  factory _$$RunningActiveImplCopyWith(
    _$RunningActiveImpl value,
    $Res Function(_$RunningActiveImpl) then,
  ) = __$$RunningActiveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    List<GpsPoint> route,
    double distanceKm,
    Duration elapsed,
    String currentPace,
  });
}

/// @nodoc
class __$$RunningActiveImplCopyWithImpl<$Res>
    extends _$RunningStateCopyWithImpl<$Res, _$RunningActiveImpl>
    implements _$$RunningActiveImplCopyWith<$Res> {
  __$$RunningActiveImplCopyWithImpl(
    _$RunningActiveImpl _value,
    $Res Function(_$RunningActiveImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RunningState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? distanceKm = null,
    Object? elapsed = null,
    Object? currentPace = null,
  }) {
    return _then(
      _$RunningActiveImpl(
        route: null == route
            ? _value._route
            : route // ignore: cast_nullable_to_non_nullable
                  as List<GpsPoint>,
        distanceKm: null == distanceKm
            ? _value.distanceKm
            : distanceKm // ignore: cast_nullable_to_non_nullable
                  as double,
        elapsed: null == elapsed
            ? _value.elapsed
            : elapsed // ignore: cast_nullable_to_non_nullable
                  as Duration,
        currentPace: null == currentPace
            ? _value.currentPace
            : currentPace // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RunningActiveImpl implements RunningActive {
  const _$RunningActiveImpl({
    required final List<GpsPoint> route,
    required this.distanceKm,
    required this.elapsed,
    required this.currentPace,
  }) : _route = route;

  final List<GpsPoint> _route;
  @override
  List<GpsPoint> get route {
    if (_route is EqualUnmodifiableListView) return _route;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_route);
  }

  @override
  final double distanceKm;
  @override
  final Duration elapsed;
  @override
  final String currentPace;

  @override
  String toString() {
    return 'RunningState.active(route: $route, distanceKm: $distanceKm, elapsed: $elapsed, currentPace: $currentPace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunningActiveImpl &&
            const DeepCollectionEquality().equals(other._route, _route) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.elapsed, elapsed) || other.elapsed == elapsed) &&
            (identical(other.currentPace, currentPace) ||
                other.currentPace == currentPace));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_route),
    distanceKm,
    elapsed,
    currentPace,
  );

  /// Create a copy of RunningState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RunningActiveImplCopyWith<_$RunningActiveImpl> get copyWith =>
      __$$RunningActiveImplCopyWithImpl<_$RunningActiveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )
    active,
    required TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
    )
    paused,
    required TResult Function(RunRecord record) finished,
    required TResult Function(String message) error,
  }) {
    return active(route, distanceKm, elapsed, currentPace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )?
    active,
    TResult? Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
    )?
    paused,
    TResult? Function(RunRecord record)? finished,
    TResult? Function(String message)? error,
  }) {
    return active?.call(route, distanceKm, elapsed, currentPace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )?
    active,
    TResult Function(List<GpsPoint> route, double distanceKm, Duration elapsed)?
    paused,
    TResult Function(RunRecord record)? finished,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(route, distanceKm, elapsed, currentPace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RunningIdle value) idle,
    required TResult Function(RunningActive value) active,
    required TResult Function(RunningPaused value) paused,
    required TResult Function(RunningFinished value) finished,
    required TResult Function(RunningError value) error,
  }) {
    return active(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RunningIdle value)? idle,
    TResult? Function(RunningActive value)? active,
    TResult? Function(RunningPaused value)? paused,
    TResult? Function(RunningFinished value)? finished,
    TResult? Function(RunningError value)? error,
  }) {
    return active?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RunningIdle value)? idle,
    TResult Function(RunningActive value)? active,
    TResult Function(RunningPaused value)? paused,
    TResult Function(RunningFinished value)? finished,
    TResult Function(RunningError value)? error,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(this);
    }
    return orElse();
  }
}

abstract class RunningActive implements RunningState {
  const factory RunningActive({
    required final List<GpsPoint> route,
    required final double distanceKm,
    required final Duration elapsed,
    required final String currentPace,
  }) = _$RunningActiveImpl;

  List<GpsPoint> get route;
  double get distanceKm;
  Duration get elapsed;
  String get currentPace;

  /// Create a copy of RunningState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RunningActiveImplCopyWith<_$RunningActiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RunningPausedImplCopyWith<$Res> {
  factory _$$RunningPausedImplCopyWith(
    _$RunningPausedImpl value,
    $Res Function(_$RunningPausedImpl) then,
  ) = __$$RunningPausedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GpsPoint> route, double distanceKm, Duration elapsed});
}

/// @nodoc
class __$$RunningPausedImplCopyWithImpl<$Res>
    extends _$RunningStateCopyWithImpl<$Res, _$RunningPausedImpl>
    implements _$$RunningPausedImplCopyWith<$Res> {
  __$$RunningPausedImplCopyWithImpl(
    _$RunningPausedImpl _value,
    $Res Function(_$RunningPausedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RunningState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? route = null,
    Object? distanceKm = null,
    Object? elapsed = null,
  }) {
    return _then(
      _$RunningPausedImpl(
        route: null == route
            ? _value._route
            : route // ignore: cast_nullable_to_non_nullable
                  as List<GpsPoint>,
        distanceKm: null == distanceKm
            ? _value.distanceKm
            : distanceKm // ignore: cast_nullable_to_non_nullable
                  as double,
        elapsed: null == elapsed
            ? _value.elapsed
            : elapsed // ignore: cast_nullable_to_non_nullable
                  as Duration,
      ),
    );
  }
}

/// @nodoc

class _$RunningPausedImpl implements RunningPaused {
  const _$RunningPausedImpl({
    required final List<GpsPoint> route,
    required this.distanceKm,
    required this.elapsed,
  }) : _route = route;

  final List<GpsPoint> _route;
  @override
  List<GpsPoint> get route {
    if (_route is EqualUnmodifiableListView) return _route;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_route);
  }

  @override
  final double distanceKm;
  @override
  final Duration elapsed;

  @override
  String toString() {
    return 'RunningState.paused(route: $route, distanceKm: $distanceKm, elapsed: $elapsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunningPausedImpl &&
            const DeepCollectionEquality().equals(other._route, _route) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.elapsed, elapsed) || other.elapsed == elapsed));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_route),
    distanceKm,
    elapsed,
  );

  /// Create a copy of RunningState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RunningPausedImplCopyWith<_$RunningPausedImpl> get copyWith =>
      __$$RunningPausedImplCopyWithImpl<_$RunningPausedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )
    active,
    required TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
    )
    paused,
    required TResult Function(RunRecord record) finished,
    required TResult Function(String message) error,
  }) {
    return paused(route, distanceKm, elapsed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )?
    active,
    TResult? Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
    )?
    paused,
    TResult? Function(RunRecord record)? finished,
    TResult? Function(String message)? error,
  }) {
    return paused?.call(route, distanceKm, elapsed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )?
    active,
    TResult Function(List<GpsPoint> route, double distanceKm, Duration elapsed)?
    paused,
    TResult Function(RunRecord record)? finished,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(route, distanceKm, elapsed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RunningIdle value) idle,
    required TResult Function(RunningActive value) active,
    required TResult Function(RunningPaused value) paused,
    required TResult Function(RunningFinished value) finished,
    required TResult Function(RunningError value) error,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RunningIdle value)? idle,
    TResult? Function(RunningActive value)? active,
    TResult? Function(RunningPaused value)? paused,
    TResult? Function(RunningFinished value)? finished,
    TResult? Function(RunningError value)? error,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RunningIdle value)? idle,
    TResult Function(RunningActive value)? active,
    TResult Function(RunningPaused value)? paused,
    TResult Function(RunningFinished value)? finished,
    TResult Function(RunningError value)? error,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class RunningPaused implements RunningState {
  const factory RunningPaused({
    required final List<GpsPoint> route,
    required final double distanceKm,
    required final Duration elapsed,
  }) = _$RunningPausedImpl;

  List<GpsPoint> get route;
  double get distanceKm;
  Duration get elapsed;

  /// Create a copy of RunningState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RunningPausedImplCopyWith<_$RunningPausedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RunningFinishedImplCopyWith<$Res> {
  factory _$$RunningFinishedImplCopyWith(
    _$RunningFinishedImpl value,
    $Res Function(_$RunningFinishedImpl) then,
  ) = __$$RunningFinishedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RunRecord record});

  $RunRecordCopyWith<$Res> get record;
}

/// @nodoc
class __$$RunningFinishedImplCopyWithImpl<$Res>
    extends _$RunningStateCopyWithImpl<$Res, _$RunningFinishedImpl>
    implements _$$RunningFinishedImplCopyWith<$Res> {
  __$$RunningFinishedImplCopyWithImpl(
    _$RunningFinishedImpl _value,
    $Res Function(_$RunningFinishedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RunningState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? record = null}) {
    return _then(
      _$RunningFinishedImpl(
        null == record
            ? _value.record
            : record // ignore: cast_nullable_to_non_nullable
                  as RunRecord,
      ),
    );
  }

  /// Create a copy of RunningState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RunRecordCopyWith<$Res> get record {
    return $RunRecordCopyWith<$Res>(_value.record, (value) {
      return _then(_value.copyWith(record: value));
    });
  }
}

/// @nodoc

class _$RunningFinishedImpl implements RunningFinished {
  const _$RunningFinishedImpl(this.record);

  @override
  final RunRecord record;

  @override
  String toString() {
    return 'RunningState.finished(record: $record)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunningFinishedImpl &&
            (identical(other.record, record) || other.record == record));
  }

  @override
  int get hashCode => Object.hash(runtimeType, record);

  /// Create a copy of RunningState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RunningFinishedImplCopyWith<_$RunningFinishedImpl> get copyWith =>
      __$$RunningFinishedImplCopyWithImpl<_$RunningFinishedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )
    active,
    required TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
    )
    paused,
    required TResult Function(RunRecord record) finished,
    required TResult Function(String message) error,
  }) {
    return finished(record);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )?
    active,
    TResult? Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
    )?
    paused,
    TResult? Function(RunRecord record)? finished,
    TResult? Function(String message)? error,
  }) {
    return finished?.call(record);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )?
    active,
    TResult Function(List<GpsPoint> route, double distanceKm, Duration elapsed)?
    paused,
    TResult Function(RunRecord record)? finished,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(record);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RunningIdle value) idle,
    required TResult Function(RunningActive value) active,
    required TResult Function(RunningPaused value) paused,
    required TResult Function(RunningFinished value) finished,
    required TResult Function(RunningError value) error,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RunningIdle value)? idle,
    TResult? Function(RunningActive value)? active,
    TResult? Function(RunningPaused value)? paused,
    TResult? Function(RunningFinished value)? finished,
    TResult? Function(RunningError value)? error,
  }) {
    return finished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RunningIdle value)? idle,
    TResult Function(RunningActive value)? active,
    TResult Function(RunningPaused value)? paused,
    TResult Function(RunningFinished value)? finished,
    TResult Function(RunningError value)? error,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class RunningFinished implements RunningState {
  const factory RunningFinished(final RunRecord record) = _$RunningFinishedImpl;

  RunRecord get record;

  /// Create a copy of RunningState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RunningFinishedImplCopyWith<_$RunningFinishedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RunningErrorImplCopyWith<$Res> {
  factory _$$RunningErrorImplCopyWith(
    _$RunningErrorImpl value,
    $Res Function(_$RunningErrorImpl) then,
  ) = __$$RunningErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RunningErrorImplCopyWithImpl<$Res>
    extends _$RunningStateCopyWithImpl<$Res, _$RunningErrorImpl>
    implements _$$RunningErrorImplCopyWith<$Res> {
  __$$RunningErrorImplCopyWithImpl(
    _$RunningErrorImpl _value,
    $Res Function(_$RunningErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RunningState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$RunningErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RunningErrorImpl implements RunningError {
  const _$RunningErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RunningState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunningErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RunningState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RunningErrorImplCopyWith<_$RunningErrorImpl> get copyWith =>
      __$$RunningErrorImplCopyWithImpl<_$RunningErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )
    active,
    required TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
    )
    paused,
    required TResult Function(RunRecord record) finished,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )?
    active,
    TResult? Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
    )?
    paused,
    TResult? Function(RunRecord record)? finished,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
      List<GpsPoint> route,
      double distanceKm,
      Duration elapsed,
      String currentPace,
    )?
    active,
    TResult Function(List<GpsPoint> route, double distanceKm, Duration elapsed)?
    paused,
    TResult Function(RunRecord record)? finished,
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
    required TResult Function(RunningIdle value) idle,
    required TResult Function(RunningActive value) active,
    required TResult Function(RunningPaused value) paused,
    required TResult Function(RunningFinished value) finished,
    required TResult Function(RunningError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RunningIdle value)? idle,
    TResult? Function(RunningActive value)? active,
    TResult? Function(RunningPaused value)? paused,
    TResult? Function(RunningFinished value)? finished,
    TResult? Function(RunningError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RunningIdle value)? idle,
    TResult Function(RunningActive value)? active,
    TResult Function(RunningPaused value)? paused,
    TResult Function(RunningFinished value)? finished,
    TResult Function(RunningError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RunningError implements RunningState {
  const factory RunningError(final String message) = _$RunningErrorImpl;

  String get message;

  /// Create a copy of RunningState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RunningErrorImplCopyWith<_$RunningErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
