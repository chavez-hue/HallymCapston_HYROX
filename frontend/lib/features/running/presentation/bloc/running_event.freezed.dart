// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'running_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RunningEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mode, String? shapeLabel) startRequested,
    required TResult Function() pauseRequested,
    required TResult Function() resumeRequested,
    required TResult Function() stopRequested,
    required TResult Function(
      double latitude,
      double longitude,
      DateTime timestamp,
    )
    gpsUpdated,
    required TResult Function() timerTicked,
    required TResult Function(String message) errorOccurred,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mode, String? shapeLabel)? startRequested,
    TResult? Function()? pauseRequested,
    TResult? Function()? resumeRequested,
    TResult? Function()? stopRequested,
    TResult? Function(double latitude, double longitude, DateTime timestamp)?
    gpsUpdated,
    TResult? Function()? timerTicked,
    TResult? Function(String message)? errorOccurred,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mode, String? shapeLabel)? startRequested,
    TResult Function()? pauseRequested,
    TResult Function()? resumeRequested,
    TResult Function()? stopRequested,
    TResult Function(double latitude, double longitude, DateTime timestamp)?
    gpsUpdated,
    TResult Function()? timerTicked,
    TResult Function(String message)? errorOccurred,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRequested value) startRequested,
    required TResult Function(PauseRequested value) pauseRequested,
    required TResult Function(ResumeRequested value) resumeRequested,
    required TResult Function(StopRequested value) stopRequested,
    required TResult Function(GpsUpdated value) gpsUpdated,
    required TResult Function(TimerTicked value) timerTicked,
    required TResult Function(ErrorOccurred value) errorOccurred,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRequested value)? startRequested,
    TResult? Function(PauseRequested value)? pauseRequested,
    TResult? Function(ResumeRequested value)? resumeRequested,
    TResult? Function(StopRequested value)? stopRequested,
    TResult? Function(GpsUpdated value)? gpsUpdated,
    TResult? Function(TimerTicked value)? timerTicked,
    TResult? Function(ErrorOccurred value)? errorOccurred,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRequested value)? startRequested,
    TResult Function(PauseRequested value)? pauseRequested,
    TResult Function(ResumeRequested value)? resumeRequested,
    TResult Function(StopRequested value)? stopRequested,
    TResult Function(GpsUpdated value)? gpsUpdated,
    TResult Function(TimerTicked value)? timerTicked,
    TResult Function(ErrorOccurred value)? errorOccurred,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunningEventCopyWith<$Res> {
  factory $RunningEventCopyWith(
    RunningEvent value,
    $Res Function(RunningEvent) then,
  ) = _$RunningEventCopyWithImpl<$Res, RunningEvent>;
}

/// @nodoc
class _$RunningEventCopyWithImpl<$Res, $Val extends RunningEvent>
    implements $RunningEventCopyWith<$Res> {
  _$RunningEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RunningEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartRequestedImplCopyWith<$Res> {
  factory _$$StartRequestedImplCopyWith(
    _$StartRequestedImpl value,
    $Res Function(_$StartRequestedImpl) then,
  ) = __$$StartRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String mode, String? shapeLabel});
}

/// @nodoc
class __$$StartRequestedImplCopyWithImpl<$Res>
    extends _$RunningEventCopyWithImpl<$Res, _$StartRequestedImpl>
    implements _$$StartRequestedImplCopyWith<$Res> {
  __$$StartRequestedImplCopyWithImpl(
    _$StartRequestedImpl _value,
    $Res Function(_$StartRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RunningEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mode = null, Object? shapeLabel = freezed}) {
    return _then(
      _$StartRequestedImpl(
        mode: null == mode
            ? _value.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as String,
        shapeLabel: freezed == shapeLabel
            ? _value.shapeLabel
            : shapeLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$StartRequestedImpl implements StartRequested {
  const _$StartRequestedImpl({this.mode = 'random', this.shapeLabel});

  @override
  @JsonKey()
  final String mode;
  @override
  final String? shapeLabel;

  @override
  String toString() {
    return 'RunningEvent.startRequested(mode: $mode, shapeLabel: $shapeLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartRequestedImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.shapeLabel, shapeLabel) ||
                other.shapeLabel == shapeLabel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode, shapeLabel);

  /// Create a copy of RunningEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartRequestedImplCopyWith<_$StartRequestedImpl> get copyWith =>
      __$$StartRequestedImplCopyWithImpl<_$StartRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mode, String? shapeLabel) startRequested,
    required TResult Function() pauseRequested,
    required TResult Function() resumeRequested,
    required TResult Function() stopRequested,
    required TResult Function(
      double latitude,
      double longitude,
      DateTime timestamp,
    )
    gpsUpdated,
    required TResult Function() timerTicked,
    required TResult Function(String message) errorOccurred,
  }) {
    return startRequested(mode, shapeLabel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mode, String? shapeLabel)? startRequested,
    TResult? Function()? pauseRequested,
    TResult? Function()? resumeRequested,
    TResult? Function()? stopRequested,
    TResult? Function(double latitude, double longitude, DateTime timestamp)?
    gpsUpdated,
    TResult? Function()? timerTicked,
    TResult? Function(String message)? errorOccurred,
  }) {
    return startRequested?.call(mode, shapeLabel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mode, String? shapeLabel)? startRequested,
    TResult Function()? pauseRequested,
    TResult Function()? resumeRequested,
    TResult Function()? stopRequested,
    TResult Function(double latitude, double longitude, DateTime timestamp)?
    gpsUpdated,
    TResult Function()? timerTicked,
    TResult Function(String message)? errorOccurred,
    required TResult orElse(),
  }) {
    if (startRequested != null) {
      return startRequested(mode, shapeLabel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRequested value) startRequested,
    required TResult Function(PauseRequested value) pauseRequested,
    required TResult Function(ResumeRequested value) resumeRequested,
    required TResult Function(StopRequested value) stopRequested,
    required TResult Function(GpsUpdated value) gpsUpdated,
    required TResult Function(TimerTicked value) timerTicked,
    required TResult Function(ErrorOccurred value) errorOccurred,
  }) {
    return startRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRequested value)? startRequested,
    TResult? Function(PauseRequested value)? pauseRequested,
    TResult? Function(ResumeRequested value)? resumeRequested,
    TResult? Function(StopRequested value)? stopRequested,
    TResult? Function(GpsUpdated value)? gpsUpdated,
    TResult? Function(TimerTicked value)? timerTicked,
    TResult? Function(ErrorOccurred value)? errorOccurred,
  }) {
    return startRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRequested value)? startRequested,
    TResult Function(PauseRequested value)? pauseRequested,
    TResult Function(ResumeRequested value)? resumeRequested,
    TResult Function(StopRequested value)? stopRequested,
    TResult Function(GpsUpdated value)? gpsUpdated,
    TResult Function(TimerTicked value)? timerTicked,
    TResult Function(ErrorOccurred value)? errorOccurred,
    required TResult orElse(),
  }) {
    if (startRequested != null) {
      return startRequested(this);
    }
    return orElse();
  }
}

abstract class StartRequested implements RunningEvent {
  const factory StartRequested({final String mode, final String? shapeLabel}) =
      _$StartRequestedImpl;

  String get mode;
  String? get shapeLabel;

  /// Create a copy of RunningEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartRequestedImplCopyWith<_$StartRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PauseRequestedImplCopyWith<$Res> {
  factory _$$PauseRequestedImplCopyWith(
    _$PauseRequestedImpl value,
    $Res Function(_$PauseRequestedImpl) then,
  ) = __$$PauseRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PauseRequestedImplCopyWithImpl<$Res>
    extends _$RunningEventCopyWithImpl<$Res, _$PauseRequestedImpl>
    implements _$$PauseRequestedImplCopyWith<$Res> {
  __$$PauseRequestedImplCopyWithImpl(
    _$PauseRequestedImpl _value,
    $Res Function(_$PauseRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RunningEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PauseRequestedImpl implements PauseRequested {
  const _$PauseRequestedImpl();

  @override
  String toString() {
    return 'RunningEvent.pauseRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PauseRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mode, String? shapeLabel) startRequested,
    required TResult Function() pauseRequested,
    required TResult Function() resumeRequested,
    required TResult Function() stopRequested,
    required TResult Function(
      double latitude,
      double longitude,
      DateTime timestamp,
    )
    gpsUpdated,
    required TResult Function() timerTicked,
    required TResult Function(String message) errorOccurred,
  }) {
    return pauseRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mode, String? shapeLabel)? startRequested,
    TResult? Function()? pauseRequested,
    TResult? Function()? resumeRequested,
    TResult? Function()? stopRequested,
    TResult? Function(double latitude, double longitude, DateTime timestamp)?
    gpsUpdated,
    TResult? Function()? timerTicked,
    TResult? Function(String message)? errorOccurred,
  }) {
    return pauseRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mode, String? shapeLabel)? startRequested,
    TResult Function()? pauseRequested,
    TResult Function()? resumeRequested,
    TResult Function()? stopRequested,
    TResult Function(double latitude, double longitude, DateTime timestamp)?
    gpsUpdated,
    TResult Function()? timerTicked,
    TResult Function(String message)? errorOccurred,
    required TResult orElse(),
  }) {
    if (pauseRequested != null) {
      return pauseRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRequested value) startRequested,
    required TResult Function(PauseRequested value) pauseRequested,
    required TResult Function(ResumeRequested value) resumeRequested,
    required TResult Function(StopRequested value) stopRequested,
    required TResult Function(GpsUpdated value) gpsUpdated,
    required TResult Function(TimerTicked value) timerTicked,
    required TResult Function(ErrorOccurred value) errorOccurred,
  }) {
    return pauseRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRequested value)? startRequested,
    TResult? Function(PauseRequested value)? pauseRequested,
    TResult? Function(ResumeRequested value)? resumeRequested,
    TResult? Function(StopRequested value)? stopRequested,
    TResult? Function(GpsUpdated value)? gpsUpdated,
    TResult? Function(TimerTicked value)? timerTicked,
    TResult? Function(ErrorOccurred value)? errorOccurred,
  }) {
    return pauseRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRequested value)? startRequested,
    TResult Function(PauseRequested value)? pauseRequested,
    TResult Function(ResumeRequested value)? resumeRequested,
    TResult Function(StopRequested value)? stopRequested,
    TResult Function(GpsUpdated value)? gpsUpdated,
    TResult Function(TimerTicked value)? timerTicked,
    TResult Function(ErrorOccurred value)? errorOccurred,
    required TResult orElse(),
  }) {
    if (pauseRequested != null) {
      return pauseRequested(this);
    }
    return orElse();
  }
}

abstract class PauseRequested implements RunningEvent {
  const factory PauseRequested() = _$PauseRequestedImpl;
}

/// @nodoc
abstract class _$$ResumeRequestedImplCopyWith<$Res> {
  factory _$$ResumeRequestedImplCopyWith(
    _$ResumeRequestedImpl value,
    $Res Function(_$ResumeRequestedImpl) then,
  ) = __$$ResumeRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResumeRequestedImplCopyWithImpl<$Res>
    extends _$RunningEventCopyWithImpl<$Res, _$ResumeRequestedImpl>
    implements _$$ResumeRequestedImplCopyWith<$Res> {
  __$$ResumeRequestedImplCopyWithImpl(
    _$ResumeRequestedImpl _value,
    $Res Function(_$ResumeRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RunningEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResumeRequestedImpl implements ResumeRequested {
  const _$ResumeRequestedImpl();

  @override
  String toString() {
    return 'RunningEvent.resumeRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResumeRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mode, String? shapeLabel) startRequested,
    required TResult Function() pauseRequested,
    required TResult Function() resumeRequested,
    required TResult Function() stopRequested,
    required TResult Function(
      double latitude,
      double longitude,
      DateTime timestamp,
    )
    gpsUpdated,
    required TResult Function() timerTicked,
    required TResult Function(String message) errorOccurred,
  }) {
    return resumeRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mode, String? shapeLabel)? startRequested,
    TResult? Function()? pauseRequested,
    TResult? Function()? resumeRequested,
    TResult? Function()? stopRequested,
    TResult? Function(double latitude, double longitude, DateTime timestamp)?
    gpsUpdated,
    TResult? Function()? timerTicked,
    TResult? Function(String message)? errorOccurred,
  }) {
    return resumeRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mode, String? shapeLabel)? startRequested,
    TResult Function()? pauseRequested,
    TResult Function()? resumeRequested,
    TResult Function()? stopRequested,
    TResult Function(double latitude, double longitude, DateTime timestamp)?
    gpsUpdated,
    TResult Function()? timerTicked,
    TResult Function(String message)? errorOccurred,
    required TResult orElse(),
  }) {
    if (resumeRequested != null) {
      return resumeRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRequested value) startRequested,
    required TResult Function(PauseRequested value) pauseRequested,
    required TResult Function(ResumeRequested value) resumeRequested,
    required TResult Function(StopRequested value) stopRequested,
    required TResult Function(GpsUpdated value) gpsUpdated,
    required TResult Function(TimerTicked value) timerTicked,
    required TResult Function(ErrorOccurred value) errorOccurred,
  }) {
    return resumeRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRequested value)? startRequested,
    TResult? Function(PauseRequested value)? pauseRequested,
    TResult? Function(ResumeRequested value)? resumeRequested,
    TResult? Function(StopRequested value)? stopRequested,
    TResult? Function(GpsUpdated value)? gpsUpdated,
    TResult? Function(TimerTicked value)? timerTicked,
    TResult? Function(ErrorOccurred value)? errorOccurred,
  }) {
    return resumeRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRequested value)? startRequested,
    TResult Function(PauseRequested value)? pauseRequested,
    TResult Function(ResumeRequested value)? resumeRequested,
    TResult Function(StopRequested value)? stopRequested,
    TResult Function(GpsUpdated value)? gpsUpdated,
    TResult Function(TimerTicked value)? timerTicked,
    TResult Function(ErrorOccurred value)? errorOccurred,
    required TResult orElse(),
  }) {
    if (resumeRequested != null) {
      return resumeRequested(this);
    }
    return orElse();
  }
}

abstract class ResumeRequested implements RunningEvent {
  const factory ResumeRequested() = _$ResumeRequestedImpl;
}

/// @nodoc
abstract class _$$StopRequestedImplCopyWith<$Res> {
  factory _$$StopRequestedImplCopyWith(
    _$StopRequestedImpl value,
    $Res Function(_$StopRequestedImpl) then,
  ) = __$$StopRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopRequestedImplCopyWithImpl<$Res>
    extends _$RunningEventCopyWithImpl<$Res, _$StopRequestedImpl>
    implements _$$StopRequestedImplCopyWith<$Res> {
  __$$StopRequestedImplCopyWithImpl(
    _$StopRequestedImpl _value,
    $Res Function(_$StopRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RunningEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StopRequestedImpl implements StopRequested {
  const _$StopRequestedImpl();

  @override
  String toString() {
    return 'RunningEvent.stopRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StopRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mode, String? shapeLabel) startRequested,
    required TResult Function() pauseRequested,
    required TResult Function() resumeRequested,
    required TResult Function() stopRequested,
    required TResult Function(
      double latitude,
      double longitude,
      DateTime timestamp,
    )
    gpsUpdated,
    required TResult Function() timerTicked,
    required TResult Function(String message) errorOccurred,
  }) {
    return stopRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mode, String? shapeLabel)? startRequested,
    TResult? Function()? pauseRequested,
    TResult? Function()? resumeRequested,
    TResult? Function()? stopRequested,
    TResult? Function(double latitude, double longitude, DateTime timestamp)?
    gpsUpdated,
    TResult? Function()? timerTicked,
    TResult? Function(String message)? errorOccurred,
  }) {
    return stopRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mode, String? shapeLabel)? startRequested,
    TResult Function()? pauseRequested,
    TResult Function()? resumeRequested,
    TResult Function()? stopRequested,
    TResult Function(double latitude, double longitude, DateTime timestamp)?
    gpsUpdated,
    TResult Function()? timerTicked,
    TResult Function(String message)? errorOccurred,
    required TResult orElse(),
  }) {
    if (stopRequested != null) {
      return stopRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRequested value) startRequested,
    required TResult Function(PauseRequested value) pauseRequested,
    required TResult Function(ResumeRequested value) resumeRequested,
    required TResult Function(StopRequested value) stopRequested,
    required TResult Function(GpsUpdated value) gpsUpdated,
    required TResult Function(TimerTicked value) timerTicked,
    required TResult Function(ErrorOccurred value) errorOccurred,
  }) {
    return stopRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRequested value)? startRequested,
    TResult? Function(PauseRequested value)? pauseRequested,
    TResult? Function(ResumeRequested value)? resumeRequested,
    TResult? Function(StopRequested value)? stopRequested,
    TResult? Function(GpsUpdated value)? gpsUpdated,
    TResult? Function(TimerTicked value)? timerTicked,
    TResult? Function(ErrorOccurred value)? errorOccurred,
  }) {
    return stopRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRequested value)? startRequested,
    TResult Function(PauseRequested value)? pauseRequested,
    TResult Function(ResumeRequested value)? resumeRequested,
    TResult Function(StopRequested value)? stopRequested,
    TResult Function(GpsUpdated value)? gpsUpdated,
    TResult Function(TimerTicked value)? timerTicked,
    TResult Function(ErrorOccurred value)? errorOccurred,
    required TResult orElse(),
  }) {
    if (stopRequested != null) {
      return stopRequested(this);
    }
    return orElse();
  }
}

abstract class StopRequested implements RunningEvent {
  const factory StopRequested() = _$StopRequestedImpl;
}

/// @nodoc
abstract class _$$GpsUpdatedImplCopyWith<$Res> {
  factory _$$GpsUpdatedImplCopyWith(
    _$GpsUpdatedImpl value,
    $Res Function(_$GpsUpdatedImpl) then,
  ) = __$$GpsUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double latitude, double longitude, DateTime timestamp});
}

/// @nodoc
class __$$GpsUpdatedImplCopyWithImpl<$Res>
    extends _$RunningEventCopyWithImpl<$Res, _$GpsUpdatedImpl>
    implements _$$GpsUpdatedImplCopyWith<$Res> {
  __$$GpsUpdatedImplCopyWithImpl(
    _$GpsUpdatedImpl _value,
    $Res Function(_$GpsUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RunningEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$GpsUpdatedImpl(
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$GpsUpdatedImpl implements GpsUpdated {
  const _$GpsUpdatedImpl({
    required this.latitude,
    required this.longitude,
    required this.timestamp,
  });

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'RunningEvent.gpsUpdated(latitude: $latitude, longitude: $longitude, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GpsUpdatedImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, timestamp);

  /// Create a copy of RunningEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GpsUpdatedImplCopyWith<_$GpsUpdatedImpl> get copyWith =>
      __$$GpsUpdatedImplCopyWithImpl<_$GpsUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mode, String? shapeLabel) startRequested,
    required TResult Function() pauseRequested,
    required TResult Function() resumeRequested,
    required TResult Function() stopRequested,
    required TResult Function(
      double latitude,
      double longitude,
      DateTime timestamp,
    )
    gpsUpdated,
    required TResult Function() timerTicked,
    required TResult Function(String message) errorOccurred,
  }) {
    return gpsUpdated(latitude, longitude, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mode, String? shapeLabel)? startRequested,
    TResult? Function()? pauseRequested,
    TResult? Function()? resumeRequested,
    TResult? Function()? stopRequested,
    TResult? Function(double latitude, double longitude, DateTime timestamp)?
    gpsUpdated,
    TResult? Function()? timerTicked,
    TResult? Function(String message)? errorOccurred,
  }) {
    return gpsUpdated?.call(latitude, longitude, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mode, String? shapeLabel)? startRequested,
    TResult Function()? pauseRequested,
    TResult Function()? resumeRequested,
    TResult Function()? stopRequested,
    TResult Function(double latitude, double longitude, DateTime timestamp)?
    gpsUpdated,
    TResult Function()? timerTicked,
    TResult Function(String message)? errorOccurred,
    required TResult orElse(),
  }) {
    if (gpsUpdated != null) {
      return gpsUpdated(latitude, longitude, timestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRequested value) startRequested,
    required TResult Function(PauseRequested value) pauseRequested,
    required TResult Function(ResumeRequested value) resumeRequested,
    required TResult Function(StopRequested value) stopRequested,
    required TResult Function(GpsUpdated value) gpsUpdated,
    required TResult Function(TimerTicked value) timerTicked,
    required TResult Function(ErrorOccurred value) errorOccurred,
  }) {
    return gpsUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRequested value)? startRequested,
    TResult? Function(PauseRequested value)? pauseRequested,
    TResult? Function(ResumeRequested value)? resumeRequested,
    TResult? Function(StopRequested value)? stopRequested,
    TResult? Function(GpsUpdated value)? gpsUpdated,
    TResult? Function(TimerTicked value)? timerTicked,
    TResult? Function(ErrorOccurred value)? errorOccurred,
  }) {
    return gpsUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRequested value)? startRequested,
    TResult Function(PauseRequested value)? pauseRequested,
    TResult Function(ResumeRequested value)? resumeRequested,
    TResult Function(StopRequested value)? stopRequested,
    TResult Function(GpsUpdated value)? gpsUpdated,
    TResult Function(TimerTicked value)? timerTicked,
    TResult Function(ErrorOccurred value)? errorOccurred,
    required TResult orElse(),
  }) {
    if (gpsUpdated != null) {
      return gpsUpdated(this);
    }
    return orElse();
  }
}

abstract class GpsUpdated implements RunningEvent {
  const factory GpsUpdated({
    required final double latitude,
    required final double longitude,
    required final DateTime timestamp,
  }) = _$GpsUpdatedImpl;

  double get latitude;
  double get longitude;
  DateTime get timestamp;

  /// Create a copy of RunningEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GpsUpdatedImplCopyWith<_$GpsUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerTickedImplCopyWith<$Res> {
  factory _$$TimerTickedImplCopyWith(
    _$TimerTickedImpl value,
    $Res Function(_$TimerTickedImpl) then,
  ) = __$$TimerTickedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerTickedImplCopyWithImpl<$Res>
    extends _$RunningEventCopyWithImpl<$Res, _$TimerTickedImpl>
    implements _$$TimerTickedImplCopyWith<$Res> {
  __$$TimerTickedImplCopyWithImpl(
    _$TimerTickedImpl _value,
    $Res Function(_$TimerTickedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RunningEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimerTickedImpl implements TimerTicked {
  const _$TimerTickedImpl();

  @override
  String toString() {
    return 'RunningEvent.timerTicked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerTickedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mode, String? shapeLabel) startRequested,
    required TResult Function() pauseRequested,
    required TResult Function() resumeRequested,
    required TResult Function() stopRequested,
    required TResult Function(
      double latitude,
      double longitude,
      DateTime timestamp,
    )
    gpsUpdated,
    required TResult Function() timerTicked,
    required TResult Function(String message) errorOccurred,
  }) {
    return timerTicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mode, String? shapeLabel)? startRequested,
    TResult? Function()? pauseRequested,
    TResult? Function()? resumeRequested,
    TResult? Function()? stopRequested,
    TResult? Function(double latitude, double longitude, DateTime timestamp)?
    gpsUpdated,
    TResult? Function()? timerTicked,
    TResult? Function(String message)? errorOccurred,
  }) {
    return timerTicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mode, String? shapeLabel)? startRequested,
    TResult Function()? pauseRequested,
    TResult Function()? resumeRequested,
    TResult Function()? stopRequested,
    TResult Function(double latitude, double longitude, DateTime timestamp)?
    gpsUpdated,
    TResult Function()? timerTicked,
    TResult Function(String message)? errorOccurred,
    required TResult orElse(),
  }) {
    if (timerTicked != null) {
      return timerTicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRequested value) startRequested,
    required TResult Function(PauseRequested value) pauseRequested,
    required TResult Function(ResumeRequested value) resumeRequested,
    required TResult Function(StopRequested value) stopRequested,
    required TResult Function(GpsUpdated value) gpsUpdated,
    required TResult Function(TimerTicked value) timerTicked,
    required TResult Function(ErrorOccurred value) errorOccurred,
  }) {
    return timerTicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRequested value)? startRequested,
    TResult? Function(PauseRequested value)? pauseRequested,
    TResult? Function(ResumeRequested value)? resumeRequested,
    TResult? Function(StopRequested value)? stopRequested,
    TResult? Function(GpsUpdated value)? gpsUpdated,
    TResult? Function(TimerTicked value)? timerTicked,
    TResult? Function(ErrorOccurred value)? errorOccurred,
  }) {
    return timerTicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRequested value)? startRequested,
    TResult Function(PauseRequested value)? pauseRequested,
    TResult Function(ResumeRequested value)? resumeRequested,
    TResult Function(StopRequested value)? stopRequested,
    TResult Function(GpsUpdated value)? gpsUpdated,
    TResult Function(TimerTicked value)? timerTicked,
    TResult Function(ErrorOccurred value)? errorOccurred,
    required TResult orElse(),
  }) {
    if (timerTicked != null) {
      return timerTicked(this);
    }
    return orElse();
  }
}

abstract class TimerTicked implements RunningEvent {
  const factory TimerTicked() = _$TimerTickedImpl;
}

/// @nodoc
abstract class _$$ErrorOccurredImplCopyWith<$Res> {
  factory _$$ErrorOccurredImplCopyWith(
    _$ErrorOccurredImpl value,
    $Res Function(_$ErrorOccurredImpl) then,
  ) = __$$ErrorOccurredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorOccurredImplCopyWithImpl<$Res>
    extends _$RunningEventCopyWithImpl<$Res, _$ErrorOccurredImpl>
    implements _$$ErrorOccurredImplCopyWith<$Res> {
  __$$ErrorOccurredImplCopyWithImpl(
    _$ErrorOccurredImpl _value,
    $Res Function(_$ErrorOccurredImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RunningEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorOccurredImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorOccurredImpl implements ErrorOccurred {
  const _$ErrorOccurredImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RunningEvent.errorOccurred(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorOccurredImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RunningEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorOccurredImplCopyWith<_$ErrorOccurredImpl> get copyWith =>
      __$$ErrorOccurredImplCopyWithImpl<_$ErrorOccurredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mode, String? shapeLabel) startRequested,
    required TResult Function() pauseRequested,
    required TResult Function() resumeRequested,
    required TResult Function() stopRequested,
    required TResult Function(
      double latitude,
      double longitude,
      DateTime timestamp,
    )
    gpsUpdated,
    required TResult Function() timerTicked,
    required TResult Function(String message) errorOccurred,
  }) {
    return errorOccurred(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mode, String? shapeLabel)? startRequested,
    TResult? Function()? pauseRequested,
    TResult? Function()? resumeRequested,
    TResult? Function()? stopRequested,
    TResult? Function(double latitude, double longitude, DateTime timestamp)?
    gpsUpdated,
    TResult? Function()? timerTicked,
    TResult? Function(String message)? errorOccurred,
  }) {
    return errorOccurred?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mode, String? shapeLabel)? startRequested,
    TResult Function()? pauseRequested,
    TResult Function()? resumeRequested,
    TResult Function()? stopRequested,
    TResult Function(double latitude, double longitude, DateTime timestamp)?
    gpsUpdated,
    TResult Function()? timerTicked,
    TResult Function(String message)? errorOccurred,
    required TResult orElse(),
  }) {
    if (errorOccurred != null) {
      return errorOccurred(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartRequested value) startRequested,
    required TResult Function(PauseRequested value) pauseRequested,
    required TResult Function(ResumeRequested value) resumeRequested,
    required TResult Function(StopRequested value) stopRequested,
    required TResult Function(GpsUpdated value) gpsUpdated,
    required TResult Function(TimerTicked value) timerTicked,
    required TResult Function(ErrorOccurred value) errorOccurred,
  }) {
    return errorOccurred(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StartRequested value)? startRequested,
    TResult? Function(PauseRequested value)? pauseRequested,
    TResult? Function(ResumeRequested value)? resumeRequested,
    TResult? Function(StopRequested value)? stopRequested,
    TResult? Function(GpsUpdated value)? gpsUpdated,
    TResult? Function(TimerTicked value)? timerTicked,
    TResult? Function(ErrorOccurred value)? errorOccurred,
  }) {
    return errorOccurred?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartRequested value)? startRequested,
    TResult Function(PauseRequested value)? pauseRequested,
    TResult Function(ResumeRequested value)? resumeRequested,
    TResult Function(StopRequested value)? stopRequested,
    TResult Function(GpsUpdated value)? gpsUpdated,
    TResult Function(TimerTicked value)? timerTicked,
    TResult Function(ErrorOccurred value)? errorOccurred,
    required TResult orElse(),
  }) {
    if (errorOccurred != null) {
      return errorOccurred(this);
    }
    return orElse();
  }
}

abstract class ErrorOccurred implements RunningEvent {
  const factory ErrorOccurred(final String message) = _$ErrorOccurredImpl;

  String get message;

  /// Create a copy of RunningEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorOccurredImplCopyWith<_$ErrorOccurredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
