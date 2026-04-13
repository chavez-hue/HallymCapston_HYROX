// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RankingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RankingEntry> entries, RankingEntry? myEntry)
    loaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RankingEntry> entries, RankingEntry? myEntry)?
    loaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RankingEntry> entries, RankingEntry? myEntry)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RankingInitial value) initial,
    required TResult Function(RankingLoading value) loading,
    required TResult Function(RankingLoaded value) loaded,
    required TResult Function(RankingError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RankingInitial value)? initial,
    TResult? Function(RankingLoading value)? loading,
    TResult? Function(RankingLoaded value)? loaded,
    TResult? Function(RankingError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RankingInitial value)? initial,
    TResult Function(RankingLoading value)? loading,
    TResult Function(RankingLoaded value)? loaded,
    TResult Function(RankingError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingStateCopyWith<$Res> {
  factory $RankingStateCopyWith(
    RankingState value,
    $Res Function(RankingState) then,
  ) = _$RankingStateCopyWithImpl<$Res, RankingState>;
}

/// @nodoc
class _$RankingStateCopyWithImpl<$Res, $Val extends RankingState>
    implements $RankingStateCopyWith<$Res> {
  _$RankingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RankingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RankingInitialImplCopyWith<$Res> {
  factory _$$RankingInitialImplCopyWith(
    _$RankingInitialImpl value,
    $Res Function(_$RankingInitialImpl) then,
  ) = __$$RankingInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RankingInitialImplCopyWithImpl<$Res>
    extends _$RankingStateCopyWithImpl<$Res, _$RankingInitialImpl>
    implements _$$RankingInitialImplCopyWith<$Res> {
  __$$RankingInitialImplCopyWithImpl(
    _$RankingInitialImpl _value,
    $Res Function(_$RankingInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RankingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RankingInitialImpl implements RankingInitial {
  const _$RankingInitialImpl();

  @override
  String toString() {
    return 'RankingState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RankingInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RankingEntry> entries, RankingEntry? myEntry)
    loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RankingEntry> entries, RankingEntry? myEntry)?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RankingEntry> entries, RankingEntry? myEntry)? loaded,
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
    required TResult Function(RankingInitial value) initial,
    required TResult Function(RankingLoading value) loading,
    required TResult Function(RankingLoaded value) loaded,
    required TResult Function(RankingError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RankingInitial value)? initial,
    TResult? Function(RankingLoading value)? loading,
    TResult? Function(RankingLoaded value)? loaded,
    TResult? Function(RankingError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RankingInitial value)? initial,
    TResult Function(RankingLoading value)? loading,
    TResult Function(RankingLoaded value)? loaded,
    TResult Function(RankingError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RankingInitial implements RankingState {
  const factory RankingInitial() = _$RankingInitialImpl;
}

/// @nodoc
abstract class _$$RankingLoadingImplCopyWith<$Res> {
  factory _$$RankingLoadingImplCopyWith(
    _$RankingLoadingImpl value,
    $Res Function(_$RankingLoadingImpl) then,
  ) = __$$RankingLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RankingLoadingImplCopyWithImpl<$Res>
    extends _$RankingStateCopyWithImpl<$Res, _$RankingLoadingImpl>
    implements _$$RankingLoadingImplCopyWith<$Res> {
  __$$RankingLoadingImplCopyWithImpl(
    _$RankingLoadingImpl _value,
    $Res Function(_$RankingLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RankingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RankingLoadingImpl implements RankingLoading {
  const _$RankingLoadingImpl();

  @override
  String toString() {
    return 'RankingState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RankingLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RankingEntry> entries, RankingEntry? myEntry)
    loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RankingEntry> entries, RankingEntry? myEntry)?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RankingEntry> entries, RankingEntry? myEntry)? loaded,
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
    required TResult Function(RankingInitial value) initial,
    required TResult Function(RankingLoading value) loading,
    required TResult Function(RankingLoaded value) loaded,
    required TResult Function(RankingError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RankingInitial value)? initial,
    TResult? Function(RankingLoading value)? loading,
    TResult? Function(RankingLoaded value)? loaded,
    TResult? Function(RankingError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RankingInitial value)? initial,
    TResult Function(RankingLoading value)? loading,
    TResult Function(RankingLoaded value)? loaded,
    TResult Function(RankingError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RankingLoading implements RankingState {
  const factory RankingLoading() = _$RankingLoadingImpl;
}

/// @nodoc
abstract class _$$RankingLoadedImplCopyWith<$Res> {
  factory _$$RankingLoadedImplCopyWith(
    _$RankingLoadedImpl value,
    $Res Function(_$RankingLoadedImpl) then,
  ) = __$$RankingLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<RankingEntry> entries, RankingEntry? myEntry});

  $RankingEntryCopyWith<$Res>? get myEntry;
}

/// @nodoc
class __$$RankingLoadedImplCopyWithImpl<$Res>
    extends _$RankingStateCopyWithImpl<$Res, _$RankingLoadedImpl>
    implements _$$RankingLoadedImplCopyWith<$Res> {
  __$$RankingLoadedImplCopyWithImpl(
    _$RankingLoadedImpl _value,
    $Res Function(_$RankingLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RankingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? entries = null, Object? myEntry = freezed}) {
    return _then(
      _$RankingLoadedImpl(
        entries: null == entries
            ? _value._entries
            : entries // ignore: cast_nullable_to_non_nullable
                  as List<RankingEntry>,
        myEntry: freezed == myEntry
            ? _value.myEntry
            : myEntry // ignore: cast_nullable_to_non_nullable
                  as RankingEntry?,
      ),
    );
  }

  /// Create a copy of RankingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RankingEntryCopyWith<$Res>? get myEntry {
    if (_value.myEntry == null) {
      return null;
    }

    return $RankingEntryCopyWith<$Res>(_value.myEntry!, (value) {
      return _then(_value.copyWith(myEntry: value));
    });
  }
}

/// @nodoc

class _$RankingLoadedImpl implements RankingLoaded {
  const _$RankingLoadedImpl({
    required final List<RankingEntry> entries,
    this.myEntry,
  }) : _entries = entries;

  final List<RankingEntry> _entries;
  @override
  List<RankingEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  final RankingEntry? myEntry;

  @override
  String toString() {
    return 'RankingState.loaded(entries: $entries, myEntry: $myEntry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankingLoadedImpl &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            (identical(other.myEntry, myEntry) || other.myEntry == myEntry));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_entries),
    myEntry,
  );

  /// Create a copy of RankingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RankingLoadedImplCopyWith<_$RankingLoadedImpl> get copyWith =>
      __$$RankingLoadedImplCopyWithImpl<_$RankingLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RankingEntry> entries, RankingEntry? myEntry)
    loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(entries, myEntry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RankingEntry> entries, RankingEntry? myEntry)?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(entries, myEntry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RankingEntry> entries, RankingEntry? myEntry)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(entries, myEntry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RankingInitial value) initial,
    required TResult Function(RankingLoading value) loading,
    required TResult Function(RankingLoaded value) loaded,
    required TResult Function(RankingError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RankingInitial value)? initial,
    TResult? Function(RankingLoading value)? loading,
    TResult? Function(RankingLoaded value)? loaded,
    TResult? Function(RankingError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RankingInitial value)? initial,
    TResult Function(RankingLoading value)? loading,
    TResult Function(RankingLoaded value)? loaded,
    TResult Function(RankingError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RankingLoaded implements RankingState {
  const factory RankingLoaded({
    required final List<RankingEntry> entries,
    final RankingEntry? myEntry,
  }) = _$RankingLoadedImpl;

  List<RankingEntry> get entries;
  RankingEntry? get myEntry;

  /// Create a copy of RankingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RankingLoadedImplCopyWith<_$RankingLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RankingErrorImplCopyWith<$Res> {
  factory _$$RankingErrorImplCopyWith(
    _$RankingErrorImpl value,
    $Res Function(_$RankingErrorImpl) then,
  ) = __$$RankingErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RankingErrorImplCopyWithImpl<$Res>
    extends _$RankingStateCopyWithImpl<$Res, _$RankingErrorImpl>
    implements _$$RankingErrorImplCopyWith<$Res> {
  __$$RankingErrorImplCopyWithImpl(
    _$RankingErrorImpl _value,
    $Res Function(_$RankingErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RankingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$RankingErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RankingErrorImpl implements RankingError {
  const _$RankingErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RankingState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankingErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RankingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RankingErrorImplCopyWith<_$RankingErrorImpl> get copyWith =>
      __$$RankingErrorImplCopyWithImpl<_$RankingErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RankingEntry> entries, RankingEntry? myEntry)
    loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RankingEntry> entries, RankingEntry? myEntry)?
    loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RankingEntry> entries, RankingEntry? myEntry)? loaded,
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
    required TResult Function(RankingInitial value) initial,
    required TResult Function(RankingLoading value) loading,
    required TResult Function(RankingLoaded value) loaded,
    required TResult Function(RankingError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RankingInitial value)? initial,
    TResult? Function(RankingLoading value)? loading,
    TResult? Function(RankingLoaded value)? loaded,
    TResult? Function(RankingError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RankingInitial value)? initial,
    TResult Function(RankingLoading value)? loading,
    TResult Function(RankingLoaded value)? loaded,
    TResult Function(RankingError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RankingError implements RankingState {
  const factory RankingError(final String message) = _$RankingErrorImpl;

  String get message;

  /// Create a copy of RankingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RankingErrorImplCopyWith<_$RankingErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
