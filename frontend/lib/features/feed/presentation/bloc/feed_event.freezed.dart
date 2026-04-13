// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FeedEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(
      String userId,
      String content,
      String? runRecordId,
    )
    postRequested,
    required TResult Function(String feedId, bool isLiked) likeToggled,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(String userId, String content, String? runRecordId)?
    postRequested,
    TResult? Function(String feedId, bool isLiked)? likeToggled,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(String userId, String content, String? runRecordId)?
    postRequested,
    TResult Function(String feedId, bool isLiked)? likeToggled,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedLoadRequested value) loadRequested,
    required TResult Function(FeedPostRequested value) postRequested,
    required TResult Function(FeedLikeToggled value) likeToggled,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedLoadRequested value)? loadRequested,
    TResult? Function(FeedPostRequested value)? postRequested,
    TResult? Function(FeedLikeToggled value)? likeToggled,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedLoadRequested value)? loadRequested,
    TResult Function(FeedPostRequested value)? postRequested,
    TResult Function(FeedLikeToggled value)? likeToggled,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedEventCopyWith<$Res> {
  factory $FeedEventCopyWith(FeedEvent value, $Res Function(FeedEvent) then) =
      _$FeedEventCopyWithImpl<$Res, FeedEvent>;
}

/// @nodoc
class _$FeedEventCopyWithImpl<$Res, $Val extends FeedEvent>
    implements $FeedEventCopyWith<$Res> {
  _$FeedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FeedLoadRequestedImplCopyWith<$Res> {
  factory _$$FeedLoadRequestedImplCopyWith(
    _$FeedLoadRequestedImpl value,
    $Res Function(_$FeedLoadRequestedImpl) then,
  ) = __$$FeedLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FeedLoadRequestedImplCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$FeedLoadRequestedImpl>
    implements _$$FeedLoadRequestedImplCopyWith<$Res> {
  __$$FeedLoadRequestedImplCopyWithImpl(
    _$FeedLoadRequestedImpl _value,
    $Res Function(_$FeedLoadRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FeedLoadRequestedImpl implements FeedLoadRequested {
  const _$FeedLoadRequestedImpl();

  @override
  String toString() {
    return 'FeedEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FeedLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(
      String userId,
      String content,
      String? runRecordId,
    )
    postRequested,
    required TResult Function(String feedId, bool isLiked) likeToggled,
  }) {
    return loadRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(String userId, String content, String? runRecordId)?
    postRequested,
    TResult? Function(String feedId, bool isLiked)? likeToggled,
  }) {
    return loadRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(String userId, String content, String? runRecordId)?
    postRequested,
    TResult Function(String feedId, bool isLiked)? likeToggled,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedLoadRequested value) loadRequested,
    required TResult Function(FeedPostRequested value) postRequested,
    required TResult Function(FeedLikeToggled value) likeToggled,
  }) {
    return loadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedLoadRequested value)? loadRequested,
    TResult? Function(FeedPostRequested value)? postRequested,
    TResult? Function(FeedLikeToggled value)? likeToggled,
  }) {
    return loadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedLoadRequested value)? loadRequested,
    TResult Function(FeedPostRequested value)? postRequested,
    TResult Function(FeedLikeToggled value)? likeToggled,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(this);
    }
    return orElse();
  }
}

abstract class FeedLoadRequested implements FeedEvent {
  const factory FeedLoadRequested() = _$FeedLoadRequestedImpl;
}

/// @nodoc
abstract class _$$FeedPostRequestedImplCopyWith<$Res> {
  factory _$$FeedPostRequestedImplCopyWith(
    _$FeedPostRequestedImpl value,
    $Res Function(_$FeedPostRequestedImpl) then,
  ) = __$$FeedPostRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String content, String? runRecordId});
}

/// @nodoc
class __$$FeedPostRequestedImplCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$FeedPostRequestedImpl>
    implements _$$FeedPostRequestedImplCopyWith<$Res> {
  __$$FeedPostRequestedImplCopyWithImpl(
    _$FeedPostRequestedImpl _value,
    $Res Function(_$FeedPostRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? content = null,
    Object? runRecordId = freezed,
  }) {
    return _then(
      _$FeedPostRequestedImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        runRecordId: freezed == runRecordId
            ? _value.runRecordId
            : runRecordId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$FeedPostRequestedImpl implements FeedPostRequested {
  const _$FeedPostRequestedImpl({
    required this.userId,
    required this.content,
    this.runRecordId,
  });

  @override
  final String userId;
  @override
  final String content;
  @override
  final String? runRecordId;

  @override
  String toString() {
    return 'FeedEvent.postRequested(userId: $userId, content: $content, runRecordId: $runRecordId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedPostRequestedImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.runRecordId, runRecordId) ||
                other.runRecordId == runRecordId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, content, runRecordId);

  /// Create a copy of FeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedPostRequestedImplCopyWith<_$FeedPostRequestedImpl> get copyWith =>
      __$$FeedPostRequestedImplCopyWithImpl<_$FeedPostRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(
      String userId,
      String content,
      String? runRecordId,
    )
    postRequested,
    required TResult Function(String feedId, bool isLiked) likeToggled,
  }) {
    return postRequested(userId, content, runRecordId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(String userId, String content, String? runRecordId)?
    postRequested,
    TResult? Function(String feedId, bool isLiked)? likeToggled,
  }) {
    return postRequested?.call(userId, content, runRecordId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(String userId, String content, String? runRecordId)?
    postRequested,
    TResult Function(String feedId, bool isLiked)? likeToggled,
    required TResult orElse(),
  }) {
    if (postRequested != null) {
      return postRequested(userId, content, runRecordId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedLoadRequested value) loadRequested,
    required TResult Function(FeedPostRequested value) postRequested,
    required TResult Function(FeedLikeToggled value) likeToggled,
  }) {
    return postRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedLoadRequested value)? loadRequested,
    TResult? Function(FeedPostRequested value)? postRequested,
    TResult? Function(FeedLikeToggled value)? likeToggled,
  }) {
    return postRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedLoadRequested value)? loadRequested,
    TResult Function(FeedPostRequested value)? postRequested,
    TResult Function(FeedLikeToggled value)? likeToggled,
    required TResult orElse(),
  }) {
    if (postRequested != null) {
      return postRequested(this);
    }
    return orElse();
  }
}

abstract class FeedPostRequested implements FeedEvent {
  const factory FeedPostRequested({
    required final String userId,
    required final String content,
    final String? runRecordId,
  }) = _$FeedPostRequestedImpl;

  String get userId;
  String get content;
  String? get runRecordId;

  /// Create a copy of FeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedPostRequestedImplCopyWith<_$FeedPostRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FeedLikeToggledImplCopyWith<$Res> {
  factory _$$FeedLikeToggledImplCopyWith(
    _$FeedLikeToggledImpl value,
    $Res Function(_$FeedLikeToggledImpl) then,
  ) = __$$FeedLikeToggledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String feedId, bool isLiked});
}

/// @nodoc
class __$$FeedLikeToggledImplCopyWithImpl<$Res>
    extends _$FeedEventCopyWithImpl<$Res, _$FeedLikeToggledImpl>
    implements _$$FeedLikeToggledImplCopyWith<$Res> {
  __$$FeedLikeToggledImplCopyWithImpl(
    _$FeedLikeToggledImpl _value,
    $Res Function(_$FeedLikeToggledImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? feedId = null, Object? isLiked = null}) {
    return _then(
      _$FeedLikeToggledImpl(
        null == feedId
            ? _value.feedId
            : feedId // ignore: cast_nullable_to_non_nullable
                  as String,
        null == isLiked
            ? _value.isLiked
            : isLiked // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$FeedLikeToggledImpl implements FeedLikeToggled {
  const _$FeedLikeToggledImpl(this.feedId, this.isLiked);

  @override
  final String feedId;
  @override
  final bool isLiked;

  @override
  String toString() {
    return 'FeedEvent.likeToggled(feedId: $feedId, isLiked: $isLiked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedLikeToggledImpl &&
            (identical(other.feedId, feedId) || other.feedId == feedId) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, feedId, isLiked);

  /// Create a copy of FeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedLikeToggledImplCopyWith<_$FeedLikeToggledImpl> get copyWith =>
      __$$FeedLikeToggledImplCopyWithImpl<_$FeedLikeToggledImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(
      String userId,
      String content,
      String? runRecordId,
    )
    postRequested,
    required TResult Function(String feedId, bool isLiked) likeToggled,
  }) {
    return likeToggled(feedId, isLiked);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(String userId, String content, String? runRecordId)?
    postRequested,
    TResult? Function(String feedId, bool isLiked)? likeToggled,
  }) {
    return likeToggled?.call(feedId, isLiked);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(String userId, String content, String? runRecordId)?
    postRequested,
    TResult Function(String feedId, bool isLiked)? likeToggled,
    required TResult orElse(),
  }) {
    if (likeToggled != null) {
      return likeToggled(feedId, isLiked);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedLoadRequested value) loadRequested,
    required TResult Function(FeedPostRequested value) postRequested,
    required TResult Function(FeedLikeToggled value) likeToggled,
  }) {
    return likeToggled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedLoadRequested value)? loadRequested,
    TResult? Function(FeedPostRequested value)? postRequested,
    TResult? Function(FeedLikeToggled value)? likeToggled,
  }) {
    return likeToggled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedLoadRequested value)? loadRequested,
    TResult Function(FeedPostRequested value)? postRequested,
    TResult Function(FeedLikeToggled value)? likeToggled,
    required TResult orElse(),
  }) {
    if (likeToggled != null) {
      return likeToggled(this);
    }
    return orElse();
  }
}

abstract class FeedLikeToggled implements FeedEvent {
  const factory FeedLikeToggled(final String feedId, final bool isLiked) =
      _$FeedLikeToggledImpl;

  String get feedId;
  bool get isLiked;

  /// Create a copy of FeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedLikeToggledImplCopyWith<_$FeedLikeToggledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
