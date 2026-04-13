// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RankingModelImpl _$$RankingModelImplFromJson(Map<String, dynamic> json) =>
    _$RankingModelImpl(
      rank: (json['rank'] as num).toInt(),
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userPhotoUrl: json['userPhotoUrl'] as String?,
      puzzleCount: (json['puzzleCount'] as num).toInt(),
      totalDistanceKm: (json['totalDistanceKm'] as num).toDouble(),
      bestPace: json['bestPace'] as String,
    );

Map<String, dynamic> _$$RankingModelImplToJson(_$RankingModelImpl instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'userId': instance.userId,
      'userName': instance.userName,
      'userPhotoUrl': instance.userPhotoUrl,
      'puzzleCount': instance.puzzleCount,
      'totalDistanceKm': instance.totalDistanceKm,
      'bestPace': instance.bestPace,
    };
