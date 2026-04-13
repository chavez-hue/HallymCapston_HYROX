// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RankingEntry {
  int get rank => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String? get userPhotoUrl => throw _privateConstructorUsedError;
  int get puzzleCount => throw _privateConstructorUsedError;
  double get totalDistanceKm => throw _privateConstructorUsedError;
  String get bestPace => throw _privateConstructorUsedError;

  /// Create a copy of RankingEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RankingEntryCopyWith<RankingEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingEntryCopyWith<$Res> {
  factory $RankingEntryCopyWith(
    RankingEntry value,
    $Res Function(RankingEntry) then,
  ) = _$RankingEntryCopyWithImpl<$Res, RankingEntry>;
  @useResult
  $Res call({
    int rank,
    String userId,
    String userName,
    String? userPhotoUrl,
    int puzzleCount,
    double totalDistanceKm,
    String bestPace,
  });
}

/// @nodoc
class _$RankingEntryCopyWithImpl<$Res, $Val extends RankingEntry>
    implements $RankingEntryCopyWith<$Res> {
  _$RankingEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RankingEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? userId = null,
    Object? userName = null,
    Object? userPhotoUrl = freezed,
    Object? puzzleCount = null,
    Object? totalDistanceKm = null,
    Object? bestPace = null,
  }) {
    return _then(
      _value.copyWith(
            rank: null == rank
                ? _value.rank
                : rank // ignore: cast_nullable_to_non_nullable
                      as int,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            userName: null == userName
                ? _value.userName
                : userName // ignore: cast_nullable_to_non_nullable
                      as String,
            userPhotoUrl: freezed == userPhotoUrl
                ? _value.userPhotoUrl
                : userPhotoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            puzzleCount: null == puzzleCount
                ? _value.puzzleCount
                : puzzleCount // ignore: cast_nullable_to_non_nullable
                      as int,
            totalDistanceKm: null == totalDistanceKm
                ? _value.totalDistanceKm
                : totalDistanceKm // ignore: cast_nullable_to_non_nullable
                      as double,
            bestPace: null == bestPace
                ? _value.bestPace
                : bestPace // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RankingEntryImplCopyWith<$Res>
    implements $RankingEntryCopyWith<$Res> {
  factory _$$RankingEntryImplCopyWith(
    _$RankingEntryImpl value,
    $Res Function(_$RankingEntryImpl) then,
  ) = __$$RankingEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int rank,
    String userId,
    String userName,
    String? userPhotoUrl,
    int puzzleCount,
    double totalDistanceKm,
    String bestPace,
  });
}

/// @nodoc
class __$$RankingEntryImplCopyWithImpl<$Res>
    extends _$RankingEntryCopyWithImpl<$Res, _$RankingEntryImpl>
    implements _$$RankingEntryImplCopyWith<$Res> {
  __$$RankingEntryImplCopyWithImpl(
    _$RankingEntryImpl _value,
    $Res Function(_$RankingEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RankingEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? userId = null,
    Object? userName = null,
    Object? userPhotoUrl = freezed,
    Object? puzzleCount = null,
    Object? totalDistanceKm = null,
    Object? bestPace = null,
  }) {
    return _then(
      _$RankingEntryImpl(
        rank: null == rank
            ? _value.rank
            : rank // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        userName: null == userName
            ? _value.userName
            : userName // ignore: cast_nullable_to_non_nullable
                  as String,
        userPhotoUrl: freezed == userPhotoUrl
            ? _value.userPhotoUrl
            : userPhotoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        puzzleCount: null == puzzleCount
            ? _value.puzzleCount
            : puzzleCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalDistanceKm: null == totalDistanceKm
            ? _value.totalDistanceKm
            : totalDistanceKm // ignore: cast_nullable_to_non_nullable
                  as double,
        bestPace: null == bestPace
            ? _value.bestPace
            : bestPace // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RankingEntryImpl implements _RankingEntry {
  const _$RankingEntryImpl({
    required this.rank,
    required this.userId,
    required this.userName,
    this.userPhotoUrl,
    required this.puzzleCount,
    required this.totalDistanceKm,
    required this.bestPace,
  });

  @override
  final int rank;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String? userPhotoUrl;
  @override
  final int puzzleCount;
  @override
  final double totalDistanceKm;
  @override
  final String bestPace;

  @override
  String toString() {
    return 'RankingEntry(rank: $rank, userId: $userId, userName: $userName, userPhotoUrl: $userPhotoUrl, puzzleCount: $puzzleCount, totalDistanceKm: $totalDistanceKm, bestPace: $bestPace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankingEntryImpl &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userPhotoUrl, userPhotoUrl) ||
                other.userPhotoUrl == userPhotoUrl) &&
            (identical(other.puzzleCount, puzzleCount) ||
                other.puzzleCount == puzzleCount) &&
            (identical(other.totalDistanceKm, totalDistanceKm) ||
                other.totalDistanceKm == totalDistanceKm) &&
            (identical(other.bestPace, bestPace) ||
                other.bestPace == bestPace));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    rank,
    userId,
    userName,
    userPhotoUrl,
    puzzleCount,
    totalDistanceKm,
    bestPace,
  );

  /// Create a copy of RankingEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RankingEntryImplCopyWith<_$RankingEntryImpl> get copyWith =>
      __$$RankingEntryImplCopyWithImpl<_$RankingEntryImpl>(this, _$identity);
}

abstract class _RankingEntry implements RankingEntry {
  const factory _RankingEntry({
    required final int rank,
    required final String userId,
    required final String userName,
    final String? userPhotoUrl,
    required final int puzzleCount,
    required final double totalDistanceKm,
    required final String bestPace,
  }) = _$RankingEntryImpl;

  @override
  int get rank;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String? get userPhotoUrl;
  @override
  int get puzzleCount;
  @override
  double get totalDistanceKm;
  @override
  String get bestPace;

  /// Create a copy of RankingEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RankingEntryImplCopyWith<_$RankingEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
