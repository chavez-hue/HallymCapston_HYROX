// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'run_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RunRecord {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime get endedAt => throw _privateConstructorUsedError;
  List<GpsPoint> get route => throw _privateConstructorUsedError;
  double get distanceKm => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  String get avgPace => throw _privateConstructorUsedError;
  String? get shapeId => throw _privateConstructorUsedError;
  double get shapeSimilarity => throw _privateConstructorUsedError;
  String get mode => throw _privateConstructorUsedError;
  String? get shapeLabel => throw _privateConstructorUsedError;

  /// Create a copy of RunRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RunRecordCopyWith<RunRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunRecordCopyWith<$Res> {
  factory $RunRecordCopyWith(RunRecord value, $Res Function(RunRecord) then) =
      _$RunRecordCopyWithImpl<$Res, RunRecord>;
  @useResult
  $Res call({
    String id,
    String userId,
    DateTime startedAt,
    DateTime endedAt,
    List<GpsPoint> route,
    double distanceKm,
    Duration duration,
    String avgPace,
    String? shapeId,
    double shapeSimilarity,
    String mode,
    String? shapeLabel,
  });
}

/// @nodoc
class _$RunRecordCopyWithImpl<$Res, $Val extends RunRecord>
    implements $RunRecordCopyWith<$Res> {
  _$RunRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RunRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? startedAt = null,
    Object? endedAt = null,
    Object? route = null,
    Object? distanceKm = null,
    Object? duration = null,
    Object? avgPace = null,
    Object? shapeId = freezed,
    Object? shapeSimilarity = null,
    Object? mode = null,
    Object? shapeLabel = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endedAt: null == endedAt
                ? _value.endedAt
                : endedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            route: null == route
                ? _value.route
                : route // ignore: cast_nullable_to_non_nullable
                      as List<GpsPoint>,
            distanceKm: null == distanceKm
                ? _value.distanceKm
                : distanceKm // ignore: cast_nullable_to_non_nullable
                      as double,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            avgPace: null == avgPace
                ? _value.avgPace
                : avgPace // ignore: cast_nullable_to_non_nullable
                      as String,
            shapeId: freezed == shapeId
                ? _value.shapeId
                : shapeId // ignore: cast_nullable_to_non_nullable
                      as String?,
            shapeSimilarity: null == shapeSimilarity
                ? _value.shapeSimilarity
                : shapeSimilarity // ignore: cast_nullable_to_non_nullable
                      as double,
            mode: null == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                      as String,
            shapeLabel: freezed == shapeLabel
                ? _value.shapeLabel
                : shapeLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RunRecordImplCopyWith<$Res>
    implements $RunRecordCopyWith<$Res> {
  factory _$$RunRecordImplCopyWith(
    _$RunRecordImpl value,
    $Res Function(_$RunRecordImpl) then,
  ) = __$$RunRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    DateTime startedAt,
    DateTime endedAt,
    List<GpsPoint> route,
    double distanceKm,
    Duration duration,
    String avgPace,
    String? shapeId,
    double shapeSimilarity,
    String mode,
    String? shapeLabel,
  });
}

/// @nodoc
class __$$RunRecordImplCopyWithImpl<$Res>
    extends _$RunRecordCopyWithImpl<$Res, _$RunRecordImpl>
    implements _$$RunRecordImplCopyWith<$Res> {
  __$$RunRecordImplCopyWithImpl(
    _$RunRecordImpl _value,
    $Res Function(_$RunRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RunRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? startedAt = null,
    Object? endedAt = null,
    Object? route = null,
    Object? distanceKm = null,
    Object? duration = null,
    Object? avgPace = null,
    Object? shapeId = freezed,
    Object? shapeSimilarity = null,
    Object? mode = null,
    Object? shapeLabel = freezed,
  }) {
    return _then(
      _$RunRecordImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endedAt: null == endedAt
            ? _value.endedAt
            : endedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        route: null == route
            ? _value._route
            : route // ignore: cast_nullable_to_non_nullable
                  as List<GpsPoint>,
        distanceKm: null == distanceKm
            ? _value.distanceKm
            : distanceKm // ignore: cast_nullable_to_non_nullable
                  as double,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        avgPace: null == avgPace
            ? _value.avgPace
            : avgPace // ignore: cast_nullable_to_non_nullable
                  as String,
        shapeId: freezed == shapeId
            ? _value.shapeId
            : shapeId // ignore: cast_nullable_to_non_nullable
                  as String?,
        shapeSimilarity: null == shapeSimilarity
            ? _value.shapeSimilarity
            : shapeSimilarity // ignore: cast_nullable_to_non_nullable
                  as double,
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

class _$RunRecordImpl implements _RunRecord {
  const _$RunRecordImpl({
    required this.id,
    required this.userId,
    required this.startedAt,
    required this.endedAt,
    required final List<GpsPoint> route,
    required this.distanceKm,
    required this.duration,
    required this.avgPace,
    this.shapeId,
    this.shapeSimilarity = 0.0,
    this.mode = 'random',
    this.shapeLabel,
  }) : _route = route;

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime startedAt;
  @override
  final DateTime endedAt;
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
  final Duration duration;
  @override
  final String avgPace;
  @override
  final String? shapeId;
  @override
  @JsonKey()
  final double shapeSimilarity;
  @override
  @JsonKey()
  final String mode;
  @override
  final String? shapeLabel;

  @override
  String toString() {
    return 'RunRecord(id: $id, userId: $userId, startedAt: $startedAt, endedAt: $endedAt, route: $route, distanceKm: $distanceKm, duration: $duration, avgPace: $avgPace, shapeId: $shapeId, shapeSimilarity: $shapeSimilarity, mode: $mode, shapeLabel: $shapeLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            const DeepCollectionEquality().equals(other._route, _route) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.avgPace, avgPace) || other.avgPace == avgPace) &&
            (identical(other.shapeId, shapeId) || other.shapeId == shapeId) &&
            (identical(other.shapeSimilarity, shapeSimilarity) ||
                other.shapeSimilarity == shapeSimilarity) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.shapeLabel, shapeLabel) ||
                other.shapeLabel == shapeLabel));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    startedAt,
    endedAt,
    const DeepCollectionEquality().hash(_route),
    distanceKm,
    duration,
    avgPace,
    shapeId,
    shapeSimilarity,
    mode,
    shapeLabel,
  );

  /// Create a copy of RunRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RunRecordImplCopyWith<_$RunRecordImpl> get copyWith =>
      __$$RunRecordImplCopyWithImpl<_$RunRecordImpl>(this, _$identity);
}

abstract class _RunRecord implements RunRecord {
  const factory _RunRecord({
    required final String id,
    required final String userId,
    required final DateTime startedAt,
    required final DateTime endedAt,
    required final List<GpsPoint> route,
    required final double distanceKm,
    required final Duration duration,
    required final String avgPace,
    final String? shapeId,
    final double shapeSimilarity,
    final String mode,
    final String? shapeLabel,
  }) = _$RunRecordImpl;

  @override
  String get id;
  @override
  String get userId;
  @override
  DateTime get startedAt;
  @override
  DateTime get endedAt;
  @override
  List<GpsPoint> get route;
  @override
  double get distanceKm;
  @override
  Duration get duration;
  @override
  String get avgPace;
  @override
  String? get shapeId;
  @override
  double get shapeSimilarity;
  @override
  String get mode;
  @override
  String? get shapeLabel;

  /// Create a copy of RunRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RunRecordImplCopyWith<_$RunRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
