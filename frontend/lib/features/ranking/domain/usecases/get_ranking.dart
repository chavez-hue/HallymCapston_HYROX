import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../entities/ranking_entry.dart';
import '../repositories/ranking_repository.dart';

@injectable
class GetRanking {
  final RankingRepository _repository;

  const GetRanking(this._repository);

  Future<Either<Failure, List<RankingEntry>>> call({
    int limit = 50,
    String currentUserId = '',
  }) =>
      _repository.getGlobalRanking(
        limit: limit,
        currentUserId: currentUserId,
      );
}
