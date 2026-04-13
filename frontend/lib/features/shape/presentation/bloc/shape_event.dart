import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/shape_mission.dart';

part 'shape_event.freezed.dart';

@freezed
sealed class ShapeEvent with _$ShapeEvent {
  const factory ShapeEvent.missionsLoadRequested() = MissionsLoadRequested;

  const factory ShapeEvent.missionSelected(ShapeMission mission) =
      MissionSelected;

  const factory ShapeEvent.customShapeCreated(ShapeMission mission) =
      CustomShapeCreated;

  const factory ShapeEvent.similarityAnalysisRequested({
    required String runRecordId,
    required String missionId,
    required List<List<double>> runVertices,
  }) = SimilarityAnalysisRequested;
}
