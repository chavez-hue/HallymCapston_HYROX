// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FeedState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FeedItem> items) loaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FeedItem> items)? loaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FeedItem> items)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedInitial value) initial,
    required TResult Function(FeedLoading value) loading,
    required TResult Function(FeedLoaded value) loaded,
    required TResult Function(FeedError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedInitial value)? initial,
    TResult? Function(FeedLoading value)? loading,
    TResult? Function(FeedLoaded value)? loaded,
    TResult? Function(FeedError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedInitial value)? initial,
    TResult Function(FeedLoading value)? loading,
    TResult Function(FeedLoaded value)? loaded,
    TResult Function(FeedError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedStateCopyWith<$Res> {
  factory $FeedStateCopyWith(FeedState value, $Res Function(FeedState) then) =
      _$FeedStateCopyWithImpl<$Res, FeedState>;
}

/// @nodoc
class _$FeedStateCopyWithImpl<$Res, $Val extends FeedState>
    implements $FeedStateCopyWith<$Res> {
  _$FeedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FeedInitialImplCopyWith<$Res> {
  factory _$$FeedInitialImplCopyWith(
    _$FeedInitialImpl value,
    $Res Function(_$FeedInitialImpl) then,
  ) = __$$FeedInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FeedInitialImplCopyWithImpl<$Res>
    extends _$FeedStateCopyWithImpl<$Res, _$FeedInitialImpl>
    implements _$$FeedInitialImplCopyWith<$Res> {
  __$$FeedInitialImplCopyWithImpl(
    _$FeedInitialImpl _value,
    $Res Function(_$FeedInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FeedInitialImpl implements FeedInitial {
  const _$FeedInitialImpl();

  @override
  String toString() {
    return 'FeedState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FeedInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FeedItem> items) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FeedItem> items)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FeedItem> items)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedInitial value) initial,
    required TResult Function(FeedLoading value) loading,
    required TResult Function(FeedLoaded value) loaded,
    required TResult Function(FeedError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedInitial value)? initial,
    TResult? Function(FeedLoading value)? loading,
    TResult? Function(FeedLoaded value)? loaded,
    TResult? Function(FeedError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedInitial value)? initial,
    TResult Function(FeedLoading value)? loading,
    TResult Function(FeedLoaded value)? loaded,
    TResult Function(FeedError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FeedInitial implements FeedState {
  const factory FeedInitial() = _$FeedInitialImpl;
}

/// @nodoc
abstract class _$$FeedLoadingImplCopyWith<$Res> {
  factory _$$FeedLoadingImplCopyWith(
    _$FeedLoadingImpl value,
    $Res Function(_$FeedLoadingImpl) then,
  ) = __$$FeedLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FeedLoadingImplCopyWithImpl<$Res>
    extends _$FeedStateCopyWithImpl<$Res, _$FeedLoadingImpl>
    implements _$$FeedLoadingImplCopyWith<$Res> {
  __$$FeedLoadingImplCopyWithImpl(
    _$FeedLoadingImpl _value,
    $Res Function(_$FeedLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FeedLoadingImpl implements FeedLoading {
  const _$FeedLoadingImpl();

  @override
  String toString() {
    return 'FeedState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FeedLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FeedItem> items) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FeedItem> items)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FeedItem> items)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedInitial value) initial,
    required TResult Function(FeedLoading value) loading,
    required TResult Function(FeedLoaded value) loaded,
    required TResult Function(FeedError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedInitial value)? initial,
    TResult? Function(FeedLoading value)? loading,
    TResult? Function(FeedLoaded value)? loaded,
    TResult? Function(FeedError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedInitial value)? initial,
    TResult Function(FeedLoading value)? loading,
    TResult Function(FeedLoaded value)? loaded,
    TResult Function(FeedError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FeedLoading implements FeedState {
  const factory FeedLoading() = _$FeedLoadingImpl;
}

/// @nodoc
abstract class _$$FeedLoadedImplCopyWith<$Res> {
  factory _$$FeedLoadedImplCopyWith(
    _$FeedLoadedImpl value,
    $Res Function(_$FeedLoadedImpl) then,
  ) = __$$FeedLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FeedItem> items});
}

/// @nodoc
class __$$FeedLoadedImplCopyWithImpl<$Res>
    extends _$FeedStateCopyWithImpl<$Res, _$FeedLoadedImpl>
    implements _$$FeedLoadedImplCopyWith<$Res> {
  __$$FeedLoadedImplCopyWithImpl(
    _$FeedLoadedImpl _value,
    $Res Function(_$FeedLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$FeedLoadedImpl(
        null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<FeedItem>,
      ),
    );
  }
}

/// @nodoc

class _$FeedLoadedImpl implements FeedLoaded {
  const _$FeedLoadedImpl(final List<FeedItem> items) : _items = items;

  final List<FeedItem> _items;
  @override
  List<FeedItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'FeedState.loaded(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedLoadedImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of FeedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedLoadedImplCopyWith<_$FeedLoadedImpl> get copyWith =>
      __$$FeedLoadedImplCopyWithImpl<_$FeedLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FeedItem> items) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FeedItem> items)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FeedItem> items)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedInitial value) initial,
    required TResult Function(FeedLoading value) loading,
    required TResult Function(FeedLoaded value) loaded,
    required TResult Function(FeedError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedInitial value)? initial,
    TResult? Function(FeedLoading value)? loading,
    TResult? Function(FeedLoaded value)? loaded,
    TResult? Function(FeedError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedInitial value)? initial,
    TResult Function(FeedLoading value)? loading,
    TResult Function(FeedLoaded value)? loaded,
    TResult Function(FeedError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class FeedLoaded implements FeedState {
  const factory FeedLoaded(final List<FeedItem> items) = _$FeedLoadedImpl;

  List<FeedItem> get items;

  /// Create a copy of FeedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedLoadedImplCopyWith<_$FeedLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FeedErrorImplCopyWith<$Res> {
  factory _$$FeedErrorImplCopyWith(
    _$FeedErrorImpl value,
    $Res Function(_$FeedErrorImpl) then,
  ) = __$$FeedErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FeedErrorImplCopyWithImpl<$Res>
    extends _$FeedStateCopyWithImpl<$Res, _$FeedErrorImpl>
    implements _$$FeedErrorImplCopyWith<$Res> {
  __$$FeedErrorImplCopyWithImpl(
    _$FeedErrorImpl _value,
    $Res Function(_$FeedErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$FeedErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$FeedErrorImpl implements FeedError {
  const _$FeedErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'FeedState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of FeedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedErrorImplCopyWith<_$FeedErrorImpl> get copyWith =>
      __$$FeedErrorImplCopyWithImpl<_$FeedErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<FeedItem> items) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<FeedItem> items)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<FeedItem> items)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FeedInitial value) initial,
    required TResult Function(FeedLoading value) loading,
    required TResult Function(FeedLoaded value) loaded,
    required TResult Function(FeedError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FeedInitial value)? initial,
    TResult? Function(FeedLoading value)? loading,
    TResult? Function(FeedLoaded value)? loaded,
    TResult? Function(FeedError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FeedInitial value)? initial,
    TResult Function(FeedLoading value)? loading,
    TResult Function(FeedLoaded value)? loaded,
    TResult Function(FeedError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class FeedError implements FeedState {
  const factory FeedError(final String message) = _$FeedErrorImpl;

  String get message;

  /// Create a copy of FeedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedErrorImplCopyWith<_$FeedErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
