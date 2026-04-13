import 'package:freezed_annotation/freezed_annotation.dart';

import 'gps_point.dart';

part 'run_record.freezed.dart';

@freezed
class RunRecord with _$RunRecord {
  const factory RunRecord({
    required String id,
    required String userId,
    required DateTime startedAt,
    required DateTime endedAt,
    required List<GpsPoint> route,
    required double distanceKm,
    required Duration duration,
    required String avgPace,
    String? shapeId,
    @Default(0.0) double shapeSimilarity,
    @Default('random') String mode,
    String? shapeLabel,
  }) = _RunRecord;
}
