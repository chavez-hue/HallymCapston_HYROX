import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_feed.dart';
import '../../domain/usecases/post_feed.dart';
import 'feed_event.dart';
import 'feed_state.dart';

@injectable
class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final GetFeed _getFeed;
  final PostFeed _postFeed;

  FeedBloc(this._getFeed, this._postFeed) : super(const FeedState.initial()) {
    on<FeedLoadRequested>(_onLoadRequested);
    on<FeedPostRequested>(_onPostRequested);
    on<FeedLikeToggled>(_onLikeToggled);
  }

  Future<void> _onLoadRequested(
    FeedLoadRequested event,
    Emitter<FeedState> emit,
  ) async {
    emit(const FeedState.loading());
    final result = await _getFeed();
    result.fold(
      (f) => emit(FeedState.error(f.toString())),
      (items) => emit(FeedState.loaded(items)),
    );
  }

  Future<void> _onPostRequested(
    FeedPostRequested event,
    Emitter<FeedState> emit,
  ) async {
    final result = await _postFeed(
      userId: event.userId,
      content: event.content,
      runRecordId: event.runRecordId,
    );
    result.fold(
      (f) => emit(FeedState.error(f.toString())),
      (_) => add(const FeedEvent.loadRequested()),
    );
  }

  Future<void> _onLikeToggled(
    FeedLikeToggled event,
    Emitter<FeedState> emit,
  ) async {
    // TODO: inject LikeFeed / UnlikeFeed use cases
  }
}
