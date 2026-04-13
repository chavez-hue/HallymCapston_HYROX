import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/ranking_entry.dart';

part 'ranking_model.freezed.dart';
part 'ranking_model.g.dart';

@freezed
class RankingModel with _$RankingModel {
  const factory RankingModel({
    required int rank,
    required String userId,
    required String userName,
    String? userPhotoUrl,
    required int puzzleCount,
    required double totalDistanceKm,
    required String bestPace,
  }) = _RankingModel;

  factory RankingModel.fromJson(Map<String, dynamic> json) =>
      _$RankingModelFromJson(json);
}

extension RankingModelX on RankingModel {
  RankingEntry toEntity() => RankingEntry(
        rank: rank,
        userId: userId,
        userName: userName,
        userPhotoUrl: userPhotoUrl,
        puzzleCount: puzzleCount,
        totalDistanceKm: totalDistanceKm,
        bestPace: bestPace,
      );
}
