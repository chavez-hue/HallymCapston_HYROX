// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'run_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RunRecordModel _$RunRecordModelFromJson(Map<String, dynamic> json) {
  return _RunRecordModel.fromJson(json);
}

/// @nodoc
mixin _$RunRecordModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime get endedAt => throw _privateConstructorUsedError;
  List<GpsPointModel> get route => throw _privateConstructorUsedError;
  double get distanceKm => throw _privateConstructorUsedError;
  int get durationSeconds => throw _privateConstructorUsedError;
  String get avgPace => throw _privateConstructorUsedError;
  String? get shapeId => throw _privateConstructorUsedError;
  double get shapeSimilarity => throw _privateConstructorUsedError;
  String get mode => throw _privateConstructorUsedError;
  String? get shapeLabel => throw _privateConstructorUsedError;

  /// Serializes this RunRecordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RunRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RunRecordModelCopyWith<RunRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RunRecordModelCopyWith<$Res> {
  factory $RunRecordModelCopyWith(
    RunRecordModel value,
    $Res Function(RunRecordModel) then,
  ) = _$RunRecordModelCopyWithImpl<$Res, RunRecordModel>;
  @useResult
  $Res call({
    String id,
    String userId,
    DateTime startedAt,
    DateTime endedAt,
    List<GpsPointModel> route,
    double distanceKm,
    int durationSeconds,
    String avgPace,
    String? shapeId,
    double shapeSimilarity,
    String mode,
    String? shapeLabel,
  });
}

/// @nodoc
class _$RunRecordModelCopyWithImpl<$Res, $Val extends RunRecordModel>
    implements $RunRecordModelCopyWith<$Res> {
  _$RunRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RunRecordModel
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
    Object? durationSeconds = null,
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
                      as List<GpsPointModel>,
            distanceKm: null == distanceKm
                ? _value.distanceKm
                : distanceKm // ignore: cast_nullable_to_non_nullable
                      as double,
            durationSeconds: null == durationSeconds
                ? _value.durationSeconds
                : durationSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$RunRecordModelImplCopyWith<$Res>
    implements $RunRecordModelCopyWith<$Res> {
  factory _$$RunRecordModelImplCopyWith(
    _$RunRecordModelImpl value,
    $Res Function(_$RunRecordModelImpl) then,
  ) = __$$RunRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    DateTime startedAt,
    DateTime endedAt,
    List<GpsPointModel> route,
    double distanceKm,
    int durationSeconds,
    String avgPace,
    String? shapeId,
    double shapeSimilarity,
    String mode,
    String? shapeLabel,
  });
}

/// @nodoc
class __$$RunRecordModelImplCopyWithImpl<$Res>
    extends _$RunRecordModelCopyWithImpl<$Res, _$RunRecordModelImpl>
    implements _$$RunRecordModelImplCopyWith<$Res> {
  __$$RunRecordModelImplCopyWithImpl(
    _$RunRecordModelImpl _value,
    $Res Function(_$RunRecordModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RunRecordModel
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
    Object? durationSeconds = null,
    Object? avgPace = null,
    Object? shapeId = freezed,
    Object? shapeSimilarity = null,
    Object? mode = null,
    Object? shapeLabel = freezed,
  }) {
    return _then(
      _$RunRecordModelImpl(
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
                  as List<GpsPointModel>,
        distanceKm: null == distanceKm
            ? _value.distanceKm
            : distanceKm // ignore: cast_nullable_to_non_nullable
                  as double,
        durationSeconds: null == durationSeconds
            ? _value.durationSeconds
            : durationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
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
@JsonSerializable()
class _$RunRecordModelImpl implements _RunRecordModel {
  const _$RunRecordModelImpl({
    required this.id,
    required this.userId,
    required this.startedAt,
    required this.endedAt,
    required final List<GpsPointModel> route,
    required this.distanceKm,
    required this.durationSeconds,
    required this.avgPace,
    this.shapeId,
    this.shapeSimilarity = 0.0,
    this.mode = 'random',
    this.shapeLabel,
  }) : _route = route;

  factory _$RunRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RunRecordModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime startedAt;
  @override
  final DateTime endedAt;
  final List<GpsPointModel> _route;
  @override
  List<GpsPointModel> get route {
    if (_route is EqualUnmodifiableListView) return _route;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_route);
  }

  @override
  final double distanceKm;
  @override
  final int durationSeconds;
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
    return 'RunRecordModel(id: $id, userId: $userId, startedAt: $startedAt, endedAt: $endedAt, route: $route, distanceKm: $distanceKm, durationSeconds: $durationSeconds, avgPace: $avgPace, shapeId: $shapeId, shapeSimilarity: $shapeSimilarity, mode: $mode, shapeLabel: $shapeLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RunRecordModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            const DeepCollectionEquality().equals(other._route, _route) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.avgPace, avgPace) || other.avgPace == avgPace) &&
            (identical(other.shapeId, shapeId) || other.shapeId == shapeId) &&
            (identical(other.shapeSimilarity, shapeSimilarity) ||
                other.shapeSimilarity == shapeSimilarity) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.shapeLabel, shapeLabel) ||
                other.shapeLabel == shapeLabel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    startedAt,
    endedAt,
    const DeepCollectionEquality().hash(_route),
    distanceKm,
    durationSeconds,
    avgPace,
    shapeId,
    shapeSimilarity,
    mode,
    shapeLabel,
  );

  /// Create a copy of RunRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RunRecordModelImplCopyWith<_$RunRecordModelImpl> get copyWith =>
      __$$RunRecordModelImplCopyWithImpl<_$RunRecordModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RunRecordModelImplToJson(this);
  }
}

abstract class _RunRecordModel implements RunRecordModel {
  const factory _RunRecordModel({
    required final String id,
    required final String userId,
    required final DateTime startedAt,
    required final DateTime endedAt,
    required final List<GpsPointModel> route,
    required final double distanceKm,
    required final int durationSeconds,
    required final String avgPace,
    final String? shapeId,
    final double shapeSimilarity,
    final String mode,
    final String? shapeLabel,
  }) = _$RunRecordModelImpl;

  factory _RunRecordModel.fromJson(Map<String, dynamic> json) =
      _$RunRecordModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  DateTime get startedAt;
  @override
  DateTime get endedAt;
  @override
  List<GpsPointModel> get route;
  @override
  double get distanceKm;
  @override
  int get durationSeconds;
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

  /// Create a copy of RunRecordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RunRecordModelImplCopyWith<_$RunRecordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GpsPointModel _$GpsPointModelFromJson(Map<String, dynamic> json) {
  return _GpsPointModel.fromJson(json);
}

/// @nodoc
mixin _$GpsPointModel {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  double? get altitude => throw _privateConstructorUsedError;
  double? get accuracy => throw _privateConstructorUsedError;

  /// Serializes this GpsPointModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GpsPointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GpsPointModelCopyWith<GpsPointModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GpsPointModelCopyWith<$Res> {
  factory $GpsPointModelCopyWith(
    GpsPointModel value,
    $Res Function(GpsPointModel) then,
  ) = _$GpsPointModelCopyWithImpl<$Res, GpsPointModel>;
  @useResult
  $Res call({
    double latitude,
    double longitude,
    DateTime timestamp,
    double? altitude,
    double? accuracy,
  });
}

/// @nodoc
class _$GpsPointModelCopyWithImpl<$Res, $Val extends GpsPointModel>
    implements $GpsPointModelCopyWith<$Res> {
  _$GpsPointModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GpsPointModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? timestamp = null,
    Object? altitude = freezed,
    Object? accuracy = freezed,
  }) {
    return _then(
      _value.copyWith(
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
            altitude: freezed == altitude
                ? _value.altitude
                : altitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            accuracy: freezed == accuracy
                ? _value.accuracy
                : accuracy // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GpsPointModelImplCopyWith<$Res>
    implements $GpsPointModelCopyWith<$Res> {
  factory _$$GpsPointModelImplCopyWith(
    _$GpsPointModelImpl value,
    $Res Function(_$GpsPointModelImpl) then,
  ) = __$$GpsPointModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double latitude,
    double longitude,
    DateTime timestamp,
    double? altitude,
    double? accuracy,
  });
}

/// @nodoc
class __$$GpsPointModelImplCopyWithImpl<$Res>
    extends _$GpsPointModelCopyWithImpl<$Res, _$GpsPointModelImpl>
    implements _$$GpsPointModelImplCopyWith<$Res> {
  __$$GpsPointModelImplCopyWithImpl(
    _$GpsPointModelImpl _value,
    $Res Function(_$GpsPointModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GpsPointModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? timestamp = null,
    Object? altitude = freezed,
    Object? accuracy = freezed,
  }) {
    return _then(
      _$GpsPointModelImpl(
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
        altitude: freezed == altitude
            ? _value.altitude
            : altitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        accuracy: freezed == accuracy
            ? _value.accuracy
            : accuracy // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GpsPointModelImpl implements _GpsPointModel {
  const _$GpsPointModelImpl({
    required this.latitude,
    required this.longitude,
    required this.timestamp,
    this.altitude,
    this.accuracy,
  });

  factory _$GpsPointModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GpsPointModelImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final DateTime timestamp;
  @override
  final double? altitude;
  @override
  final double? accuracy;

  @override
  String toString() {
    return 'GpsPointModel(latitude: $latitude, longitude: $longitude, timestamp: $timestamp, altitude: $altitude, accuracy: $accuracy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GpsPointModelImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.altitude, altitude) ||
                other.altitude == altitude) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    latitude,
    longitude,
    timestamp,
    altitude,
    accuracy,
  );

  /// Create a copy of GpsPointModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GpsPointModelImplCopyWith<_$GpsPointModelImpl> get copyWith =>
      __$$GpsPointModelImplCopyWithImpl<_$GpsPointModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GpsPointModelImplToJson(this);
  }
}

abstract class _GpsPointModel implements GpsPointModel {
  const factory _GpsPointModel({
    required final double latitude,
    required final double longitude,
    required final DateTime timestamp,
    final double? altitude,
    final double? accuracy,
  }) = _$GpsPointModelImpl;

  factory _GpsPointModel.fromJson(Map<String, dynamic> json) =
      _$GpsPointModelImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  DateTime get timestamp;
  @override
  double? get altitude;
  @override
  double? get accuracy;

  /// Create a copy of GpsPointModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GpsPointModelImplCopyWith<_$GpsPointModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
