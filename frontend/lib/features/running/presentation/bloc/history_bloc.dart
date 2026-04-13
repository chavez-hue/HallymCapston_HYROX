import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/run_record.dart';
import '../../domain/usecases/get_run_stats.dart';

// ── States ────────────────────────────────────────────────────

sealed class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<RunRecord> records;
  HistoryLoaded(this.records);
}

class HistoryError extends HistoryState {
  final String message;
  HistoryError(this.message);
}

// ── Cubit ─────────────────────────────────────────────────────

class HistoryBloc extends Cubit<HistoryState> {
  final GetRunStats _getRunStats;

  HistoryBloc(this._getRunStats) : super(HistoryInitial());

  Future<void> loadHistory() async {
    emit(HistoryLoading());
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null || uid.isEmpty) {
      emit(HistoryLoaded(const []));
      return;
    }
    final result = await _getRunStats(uid);
    result.fold(
      (failure) => emit(HistoryError(failure.toString())),
      (records) => emit(HistoryLoaded(records)),
    );
  }
}
