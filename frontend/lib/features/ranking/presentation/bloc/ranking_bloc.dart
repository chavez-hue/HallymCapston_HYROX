import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/ranking_entry.dart';
import '../../domain/usecases/get_ranking.dart';
import 'ranking_event.dart';
import 'ranking_state.dart';

@injectable
class RankingBloc extends Bloc<RankingEvent, RankingState> {
  final GetRanking _getRanking;

  RankingBloc(this._getRanking) : super(const RankingState.initial()) {
    on<RankingLoadRequested>(_onLoadRequested);
    on<MyRankingRequested>(_onMyRankingRequested);
  }

  Future<void> _onLoadRequested(
    RankingLoadRequested event,
    Emitter<RankingState> emit,
  ) async {
    emit(const RankingState.loading());

    final currentUserId =
        fb.FirebaseAuth.instance.currentUser?.uid ?? '';

    // getGlobalRanking: top 50 + currentUser 가 밖이면 마지막 원소로 추가
    final result = await _getRanking(
      limit: 50,
      currentUserId: currentUserId,
    );

    result.fold(
      (f) => emit(RankingState.error(f.toString())),
      (allEntries) {
        // 마지막 원소가 currentUser 이고 top 50 밖 → myEntry 분리
        final bool myIsAppended = allEntries.isNotEmpty &&
            allEntries.last.userId == currentUserId &&
            allEntries.length > 1 &&
            allEntries.last.rank > 50;

        final List<RankingEntry> displayEntries =
            myIsAppended ? allEntries.sublist(0, allEntries.length - 1) : allEntries;

        // myEntry: top 50 안에 있거나 밖에 추가된 항목
        final RankingEntry? myEntry =
            allEntries.cast<RankingEntry?>().firstWhere(
                  (e) => e!.userId == currentUserId,
                  orElse: () => null,
                );

        emit(RankingState.loaded(entries: displayEntries, myEntry: myEntry));
      },
    );
  }

  Future<void> _onMyRankingRequested(
    MyRankingRequested event,
    Emitter<RankingState> emit,
  ) async {
    // loadRequested 에서 함께 처리됨
  }
}
