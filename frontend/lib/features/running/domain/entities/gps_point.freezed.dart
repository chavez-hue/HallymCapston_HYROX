// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gps_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GpsPoint {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  double? get altitude => throw _privateConstructorUsedError;
  double? get accuracy => throw _privateConstructorUsedError;

  /// Create a copy of GpsPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GpsPointCopyWith<GpsPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GpsPointCopyWith<$Res> {
  factory $GpsPointCopyWith(GpsPoint value, $Res Function(GpsPoint) then) =
      _$GpsPointCopyWithImpl<$Res, GpsPoint>;
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
class _$GpsPointCopyWithImpl<$Res, $Val extends GpsPoint>
    implements $GpsPointCopyWith<$Res> {
  _$GpsPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GpsPoint
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
abstract class _$$GpsPointImplCopyWith<$Res>
    implements $GpsPointCopyWith<$Res> {
  factory _$$GpsPointImplCopyWith(
    _$GpsPointImpl value,
    $Res Function(_$GpsPointImpl) then,
  ) = __$$GpsPointImplCopyWithImpl<$Res>;
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
class __$$GpsPointImplCopyWithImpl<$Res>
    extends _$GpsPointCopyWithImpl<$Res, _$GpsPointImpl>
    implements _$$GpsPointImplCopyWith<$Res> {
  __$$GpsPointImplCopyWithImpl(
    _$GpsPointImpl _value,
    $Res Function(_$GpsPointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GpsPoint
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
      _$GpsPointImpl(
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

class _$GpsPointImpl implements _GpsPoint {
  const _$GpsPointImpl({
    required this.latitude,
    required this.longitude,
    required this.timestamp,
    this.altitude,
    this.accuracy,
  });

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
    return 'GpsPoint(latitude: $latitude, longitude: $longitude, timestamp: $timestamp, altitude: $altitude, accuracy: $accuracy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GpsPointImpl &&
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

  @override
  int get hashCode => Object.hash(
    runtimeType,
    latitude,
    longitude,
    timestamp,
    altitude,
    accuracy,
  );

  /// Create a copy of GpsPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GpsPointImplCopyWith<_$GpsPointImpl> get copyWith =>
      __$$GpsPointImplCopyWithImpl<_$GpsPointImpl>(this, _$identity);
}

abstract class _GpsPoint implements GpsPoint {
  const factory _GpsPoint({
    required final double latitude,
    required final double longitude,
    required final DateTime timestamp,
    final double? altitude,
    final double? accuracy,
  }) = _$GpsPointImpl;

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

  /// Create a copy of GpsPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GpsPointImplCopyWith<_$GpsPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
