import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasources/feed_remote_datasource.dart';
import '../../domain/entities/run_feed_item.dart';

// ── 상태 ─────────────────────────────────────────────────────────

abstract class SocialState {}

class SocialInitial extends SocialState {}

class SocialLoading extends SocialState {}

class SocialLoaded extends SocialState {
  final List<RunFeedItem> items;
  SocialLoaded(this.items);
}

class SocialError extends SocialState {
  final String message;
  SocialError(this.message);
}

// ── Cubit ────────────────────────────────────────────────────────

class SocialCubit extends Cubit<SocialState> {
  final FeedRemoteDataSource _dataSource;
  final String currentUserId;

  SocialCubit({
    required FeedRemoteDataSource dataSource,
    required this.currentUserId,
  })  : _dataSource = dataSource,
        super(SocialInitial());

  Future<void> load() async {
    emit(SocialLoading());
    try {
      final items = await _dataSource.getRunFeed(
        limit: 30,
        currentUserId: currentUserId,
      );
      emit(SocialLoaded(items));
    } catch (e) {
      emit(SocialError(e.toString()));
    }
  }

  Future<void> toggleLike(String feedId, bool currentlyLiked) async {
    final current = state;
    if (current is! SocialLoaded) return;

    // 낙관적 업데이트
    final updatedItems = current.items.map((item) {
      if (item.id != feedId) return item;
      return item.copyWith(
        isLikedByMe: !currentlyLiked,
        likeCount: currentlyLiked ? item.likeCount - 1 : item.likeCount + 1,
      );
    }).toList();
    emit(SocialLoaded(updatedItems));

    try {
      await _dataSource.toggleLike(
        feedId: feedId,
        userId: currentUserId,
        currentlyLiked: currentlyLiked,
      );
    } catch (_) {
      // 실패 시 원상 복구
      emit(current);
    }
  }
}
