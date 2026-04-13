import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/ranking_entry.dart';

part 'ranking_state.freezed.dart';

@freezed
sealed class RankingState with _$RankingState {
  const factory RankingState.initial() = RankingInitial;
  const factory RankingState.loading() = RankingLoading;
  const factory RankingState.loaded({
    required List<RankingEntry> entries,
    RankingEntry? myEntry,
  }) = RankingLoaded;
  const factory RankingState.error(String message) = RankingError;
}
