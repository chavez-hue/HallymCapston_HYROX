import 'package:freezed_annotation/freezed_annotation.dart';

part 'gps_point.freezed.dart';

@freezed
class GpsPoint with _$GpsPoint {
  const factory GpsPoint({
    required double latitude,
    required double longitude,
    required DateTime timestamp,
    double? altitude,
    double? accuracy,
  }) = _GpsPoint;
}
