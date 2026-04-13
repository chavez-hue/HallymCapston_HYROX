// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RankingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(String userId) myRankingRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(String userId)? myRankingRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(String userId)? myRankingRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RankingLoadRequested value) loadRequested,
    required TResult Function(MyRankingRequested value) myRankingRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RankingLoadRequested value)? loadRequested,
    TResult? Function(MyRankingRequested value)? myRankingRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RankingLoadRequested value)? loadRequested,
    TResult Function(MyRankingRequested value)? myRankingRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingEventCopyWith<$Res> {
  factory $RankingEventCopyWith(
    RankingEvent value,
    $Res Function(RankingEvent) then,
  ) = _$RankingEventCopyWithImpl<$Res, RankingEvent>;
}

/// @nodoc
class _$RankingEventCopyWithImpl<$Res, $Val extends RankingEvent>
    implements $RankingEventCopyWith<$Res> {
  _$RankingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RankingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RankingLoadRequestedImplCopyWith<$Res> {
  factory _$$RankingLoadRequestedImplCopyWith(
    _$RankingLoadRequestedImpl value,
    $Res Function(_$RankingLoadRequestedImpl) then,
  ) = __$$RankingLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RankingLoadRequestedImplCopyWithImpl<$Res>
    extends _$RankingEventCopyWithImpl<$Res, _$RankingLoadRequestedImpl>
    implements _$$RankingLoadRequestedImplCopyWith<$Res> {
  __$$RankingLoadRequestedImplCopyWithImpl(
    _$RankingLoadRequestedImpl _value,
    $Res Function(_$RankingLoadRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RankingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RankingLoadRequestedImpl implements RankingLoadRequested {
  const _$RankingLoadRequestedImpl();

  @override
  String toString() {
    return 'RankingEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankingLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(String userId) myRankingRequested,
  }) {
    return loadRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(String userId)? myRankingRequested,
  }) {
    return loadRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(String userId)? myRankingRequested,
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
    required TResult Function(RankingLoadRequested value) loadRequested,
    required TResult Function(MyRankingRequested value) myRankingRequested,
  }) {
    return loadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RankingLoadRequested value)? loadRequested,
    TResult? Function(MyRankingRequested value)? myRankingRequested,
  }) {
    return loadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RankingLoadRequested value)? loadRequested,
    TResult Function(MyRankingRequested value)? myRankingRequested,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(this);
    }
    return orElse();
  }
}

abstract class RankingLoadRequested implements RankingEvent {
  const factory RankingLoadRequested() = _$RankingLoadRequestedImpl;
}

/// @nodoc
abstract class _$$MyRankingRequestedImplCopyWith<$Res> {
  factory _$$MyRankingRequestedImplCopyWith(
    _$MyRankingRequestedImpl value,
    $Res Function(_$MyRankingRequestedImpl) then,
  ) = __$$MyRankingRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$MyRankingRequestedImplCopyWithImpl<$Res>
    extends _$RankingEventCopyWithImpl<$Res, _$MyRankingRequestedImpl>
    implements _$$MyRankingRequestedImplCopyWith<$Res> {
  __$$MyRankingRequestedImplCopyWithImpl(
    _$MyRankingRequestedImpl _value,
    $Res Function(_$MyRankingRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RankingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null}) {
    return _then(
      _$MyRankingRequestedImpl(
        null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$MyRankingRequestedImpl implements MyRankingRequested {
  const _$MyRankingRequestedImpl(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'RankingEvent.myRankingRequested(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyRankingRequestedImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of RankingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyRankingRequestedImplCopyWith<_$MyRankingRequestedImpl> get copyWith =>
      __$$MyRankingRequestedImplCopyWithImpl<_$MyRankingRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(String userId) myRankingRequested,
  }) {
    return myRankingRequested(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(String userId)? myRankingRequested,
  }) {
    return myRankingRequested?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(String userId)? myRankingRequested,
    required TResult orElse(),
  }) {
    if (myRankingRequested != null) {
      return myRankingRequested(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RankingLoadRequested value) loadRequested,
    required TResult Function(MyRankingRequested value) myRankingRequested,
  }) {
    return myRankingRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RankingLoadRequested value)? loadRequested,
    TResult? Function(MyRankingRequested value)? myRankingRequested,
  }) {
    return myRankingRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RankingLoadRequested value)? loadRequested,
    TResult Function(MyRankingRequested value)? myRankingRequested,
    required TResult orElse(),
  }) {
    if (myRankingRequested != null) {
      return myRankingRequested(this);
    }
    return orElse();
  }
}

abstract class MyRankingRequested implements RankingEvent {
  const factory MyRankingRequested(final String userId) =
      _$MyRankingRequestedImpl;

  String get userId;

  /// Create a copy of RankingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyRankingRequestedImplCopyWith<_$MyRankingRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
