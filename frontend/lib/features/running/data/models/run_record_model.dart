import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/gps_point.dart';
import '../../domain/entities/run_record.dart';

part 'run_record_model.freezed.dart';
part 'run_record_model.g.dart';

@freezed
class RunRecordModel with _$RunRecordModel {
  const factory RunRecordModel({
    required String id,
    required String userId,
    required DateTime startedAt,
    required DateTime endedAt,
    required List<GpsPointModel> route,
    required double distanceKm,
    required int durationSeconds,
    required String avgPace,
    String? shapeId,
    @Default(0.0) double shapeSimilarity,
    @Default('random') String mode,
    String? shapeLabel,
  }) = _RunRecordModel;

  factory RunRecordModel.fromJson(Map<String, dynamic> json) =>
      _$RunRecordModelFromJson(json);
}

@freezed
class GpsPointModel with _$GpsPointModel {
  const factory GpsPointModel({
    required double latitude,
    required double longitude,
    required DateTime timestamp,
    double? altitude,
    double? accuracy,
  }) = _GpsPointModel;

  factory GpsPointModel.fromJson(Map<String, dynamic> json) =>
      _$GpsPointModelFromJson(json);
}

extension RunRecordModelX on RunRecordModel {
  RunRecord toEntity() => RunRecord(
        id: id,
        userId: userId,
        startedAt: startedAt,
        endedAt: endedAt,
        route: route.map((p) => p.toEntity()).toList(),
        distanceKm: distanceKm,
        duration: Duration(seconds: durationSeconds),
        avgPace: avgPace,
        shapeId: shapeId,
        shapeSimilarity: shapeSimilarity,
        mode: mode,
        shapeLabel: shapeLabel,
      );
}

extension RunRecordX on RunRecord {
  RunRecordModel toModel() => RunRecordModel(
        id: id,
        userId: userId,
        startedAt: startedAt,
        endedAt: endedAt,
        route: route
            .map((p) => GpsPointModel(
                  latitude: p.latitude,
                  longitude: p.longitude,
                  timestamp: p.timestamp,
                  altitude: p.altitude,
                  accuracy: p.accuracy,
                ))
            .toList(),
        distanceKm: distanceKm,
        durationSeconds: duration.inSeconds,
        avgPace: avgPace,
        shapeId: shapeId,
        shapeSimilarity: shapeSimilarity,
        mode: mode,
        shapeLabel: shapeLabel,
      );
}

extension GpsPointModelX on GpsPointModel {
  GpsPoint toEntity() => GpsPoint(
        latitude: latitude,
        longitude: longitude,
        timestamp: timestamp,
        altitude: altitude,
        accuracy: accuracy,
      );
}
