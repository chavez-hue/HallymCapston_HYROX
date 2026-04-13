import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_event.freezed.dart';

@freezed
sealed class RankingEvent with _$RankingEvent {
  const factory RankingEvent.loadRequested() = RankingLoadRequested;
  const factory RankingEvent.myRankingRequested(String userId) =
      MyRankingRequested;
}
