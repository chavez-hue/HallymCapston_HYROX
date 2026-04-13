import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/shape_mission.dart';
import '../../domain/entities/shape_result.dart';

part 'shape_state.freezed.dart';

@freezed
sealed class ShapeState with _$ShapeState {
  const factory ShapeState.initial() = ShapeInitial;
  const factory ShapeState.loading() = ShapeLoading;

  const factory ShapeState.missionsLoaded(
    List<ShapeMission> missions,
  ) = MissionsLoaded;

  const factory ShapeState.missionSelected(ShapeMission mission) =
      ShapeMissionSelected;

  const factory ShapeState.analysisResult(ShapeResult result) =
      ShapeAnalysisResult;

  const factory ShapeState.error(String message) = ShapeError;
}
