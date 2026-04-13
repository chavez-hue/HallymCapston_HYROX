import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/feed_item.dart';

part 'feed_state.freezed.dart';

@freezed
sealed class FeedState with _$FeedState {
  const factory FeedState.initial() = FeedInitial;
  const factory FeedState.loading() = FeedLoading;
  const factory FeedState.loaded(List<FeedItem> items) = FeedLoaded;
  const factory FeedState.error(String message) = FeedError;
}
