import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/ranking_entry.dart';

abstract interface class RankingRepository {
  /// [currentUserId] 가 top [limit] 밖이면 마지막 원소로 추가해 반환.
  Future<Either<Failure, List<RankingEntry>>> getGlobalRanking({
    int limit = 50,
    String currentUserId = '',
  });

  Future<Either<Failure, RankingEntry>> getMyRanking(String userId);
}
