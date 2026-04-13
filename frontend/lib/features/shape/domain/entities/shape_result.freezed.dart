// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shape_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ShapeResult {
  String get runRecordId => throw _privateConstructorUsedError;
  String get missionId => throw _privateConstructorUsedError;
  double get similarityScore => throw _privateConstructorUsedError; // 0.0 ~ 100.0
  bool get isPassed => throw _privateConstructorUsedError;
  DateTime get completedAt => throw _privateConstructorUsedError;
  ShapeGrade? get grade => throw _privateConstructorUsedError;

  /// Create a copy of ShapeResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShapeResultCopyWith<ShapeResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShapeResultCopyWith<$Res> {
  factory $ShapeResultCopyWith(
    ShapeResult value,
    $Res Function(ShapeResult) then,
  ) = _$ShapeResultCopyWithImpl<$Res, ShapeResult>;
  @useResult
  $Res call({
    String runRecordId,
    String missionId,
    double similarityScore,
    bool isPassed,
    DateTime completedAt,
    ShapeGrade? grade,
  });
}

/// @nodoc
class _$ShapeResultCopyWithImpl<$Res, $Val extends ShapeResult>
    implements $ShapeResultCopyWith<$Res> {
  _$ShapeResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShapeResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runRecordId = null,
    Object? missionId = null,
    Object? similarityScore = null,
    Object? isPassed = null,
    Object? completedAt = null,
    Object? grade = freezed,
  }) {
    return _then(
      _value.copyWith(
            runRecordId: null == runRecordId
                ? _value.runRecordId
                : runRecordId // ignore: cast_nullable_to_non_nullable
                      as String,
            missionId: null == missionId
                ? _value.missionId
                : missionId // ignore: cast_nullable_to_non_nullable
                      as String,
            similarityScore: null == similarityScore
                ? _value.similarityScore
                : similarityScore // ignore: cast_nullable_to_non_nullable
                      as double,
            isPassed: null == isPassed
                ? _value.isPassed
                : isPassed // ignore: cast_nullable_to_non_nullable
                      as bool,
            completedAt: null == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            grade: freezed == grade
                ? _value.grade
                : grade // ignore: cast_nullable_to_non_nullable
                      as ShapeGrade?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShapeResultImplCopyWith<$Res>
    implements $ShapeResultCopyWith<$Res> {
  factory _$$ShapeResultImplCopyWith(
    _$ShapeResultImpl value,
    $Res Function(_$ShapeResultImpl) then,
  ) = __$$ShapeResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String runRecordId,
    String missionId,
    double similarityScore,
    bool isPassed,
    DateTime completedAt,
    ShapeGrade? grade,
  });
}

/// @nodoc
class __$$ShapeResultImplCopyWithImpl<$Res>
    extends _$ShapeResultCopyWithImpl<$Res, _$ShapeResultImpl>
    implements _$$ShapeResultImplCopyWith<$Res> {
  __$$ShapeResultImplCopyWithImpl(
    _$ShapeResultImpl _value,
    $Res Function(_$ShapeResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShapeResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? runRecordId = null,
    Object? missionId = null,
    Object? similarityScore = null,
    Object? isPassed = null,
    Object? completedAt = null,
    Object? grade = freezed,
  }) {
    return _then(
      _$ShapeResultImpl(
        runRecordId: null == runRecordId
            ? _value.runRecordId
            : runRecordId // ignore: cast_nullable_to_non_nullable
                  as String,
        missionId: null == missionId
            ? _value.missionId
            : missionId // ignore: cast_nullable_to_non_nullable
                  as String,
        similarityScore: null == similarityScore
            ? _value.similarityScore
            : similarityScore // ignore: cast_nullable_to_non_nullable
                  as double,
        isPassed: null == isPassed
            ? _value.isPassed
            : isPassed // ignore: cast_nullable_to_non_nullable
                  as bool,
        completedAt: null == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        grade: freezed == grade
            ? _value.grade
            : grade // ignore: cast_nullable_to_non_nullable
                  as ShapeGrade?,
      ),
    );
  }
}

/// @nodoc

class _$ShapeResultImpl implements _ShapeResult {
  const _$ShapeResultImpl({
    required this.runRecordId,
    required this.missionId,
    required this.similarityScore,
    required this.isPassed,
    required this.completedAt,
    this.grade,
  });

  @override
  final String runRecordId;
  @override
  final String missionId;
  @override
  final double similarityScore;
  // 0.0 ~ 100.0
  @override
  final bool isPassed;
  @override
  final DateTime completedAt;
  @override
  final ShapeGrade? grade;

  @override
  String toString() {
    return 'ShapeResult(runRecordId: $runRecordId, missionId: $missionId, similarityScore: $similarityScore, isPassed: $isPassed, completedAt: $completedAt, grade: $grade)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShapeResultImpl &&
            (identical(other.runRecordId, runRecordId) ||
                other.runRecordId == runRecordId) &&
            (identical(other.missionId, missionId) ||
                other.missionId == missionId) &&
            (identical(other.similarityScore, similarityScore) ||
                other.similarityScore == similarityScore) &&
            (identical(other.isPassed, isPassed) ||
                other.isPassed == isPassed) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.grade, grade) || other.grade == grade));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    runRecordId,
    missionId,
    similarityScore,
    isPassed,
    completedAt,
    grade,
  );

  /// Create a copy of ShapeResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShapeResultImplCopyWith<_$ShapeResultImpl> get copyWith =>
      __$$ShapeResultImplCopyWithImpl<_$ShapeResultImpl>(this, _$identity);
}

abstract class _ShapeResult implements ShapeResult {
  const factory _ShapeResult({
    required final String runRecordId,
    required final String missionId,
    required final double similarityScore,
    required final bool isPassed,
    required final DateTime completedAt,
    final ShapeGrade? grade,
  }) = _$ShapeResultImpl;

  @override
  String get runRecordId;
  @override
  String get missionId;
  @override
  double get similarityScore; // 0.0 ~ 100.0
  @override
  bool get isPassed;
  @override
  DateTime get completedAt;
  @override
  ShapeGrade? get grade;

  /// Create a copy of ShapeResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShapeResultImplCopyWith<_$ShapeResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
