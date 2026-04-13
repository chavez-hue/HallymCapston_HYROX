import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/analyze_shape_similarity.dart';
import '../../domain/usecases/create_custom_shape.dart';
import 'shape_event.dart';
import 'shape_state.dart';

@injectable
class ShapeBloc extends Bloc<ShapeEvent, ShapeState> {
  final AnalyzeShapeSimilarity _analyze;
  final CreateCustomShape _createCustom;

  ShapeBloc(this._analyze, this._createCustom)
      : super(const ShapeState.initial()) {
    on<MissionsLoadRequested>(_onMissionsLoadRequested);
    on<MissionSelected>(_onMissionSelected);
    on<CustomShapeCreated>(_onCustomShapeCreated);
    on<SimilarityAnalysisRequested>(_onSimilarityAnalysisRequested);
  }

  Future<void> _onMissionsLoadRequested(
    MissionsLoadRequested event,
    Emitter<ShapeState> emit,
  ) async {
    emit(const ShapeState.loading());
    // TODO: inject and call GetMissions use case
    emit(const ShapeState.missionsLoaded([]));
  }

  Future<void> _onMissionSelected(
    MissionSelected event,
    Emitter<ShapeState> emit,
  ) async {
    emit(ShapeState.missionSelected(event.mission));
  }

  Future<void> _onCustomShapeCreated(
    CustomShapeCreated event,
    Emitter<ShapeState> emit,
  ) async {
    emit(const ShapeState.loading());
    final result = await _createCustom(event.mission);
    result.fold(
      (f) => emit(ShapeState.error(f.toString())),
      (mission) => emit(ShapeState.missionSelected(mission)),
    );
  }

  Future<void> _onSimilarityAnalysisRequested(
    SimilarityAnalysisRequested event,
    Emitter<ShapeState> emit,
  ) async {
    emit(const ShapeState.loading());
    final result = await _analyze(
      runRecordId: event.runRecordId,
      missionId: event.missionId,
      runVertices: event.runVertices,
    );
    result.fold(
      (f) => emit(ShapeState.error(f.toString())),
      (r) => emit(ShapeState.analysisResult(r)),
    );
  }
}
