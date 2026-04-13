import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_entry.freezed.dart';

@freezed
class RankingEntry with _$RankingEntry {
  const factory RankingEntry({
    required int rank,
    required String userId,
    required String userName,
    String? userPhotoUrl,
    required int puzzleCount,
    required double totalDistanceKm,
    required String bestPace,
  }) = _RankingEntry;
}
