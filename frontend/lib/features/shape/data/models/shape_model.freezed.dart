// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shape_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ShapeMissionModel _$ShapeMissionModelFromJson(Map<String, dynamic> json) {
  return _ShapeMissionModel.fromJson(json);
}

/// @nodoc
mixin _$ShapeMissionModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<List<double>> get targetVertices => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get difficulty => throw _privateConstructorUsedError;

  /// Serializes this ShapeMissionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShapeMissionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShapeMissionModelCopyWith<ShapeMissionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShapeMissionModelCopyWith<$Res> {
  factory $ShapeMissionModelCopyWith(
    ShapeMissionModel value,
    $Res Function(ShapeMissionModel) then,
  ) = _$ShapeMissionModelCopyWithImpl<$Res, ShapeMissionModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String type,
    List<List<double>> targetVertices,
    String? description,
    int difficulty,
  });
}

/// @nodoc
class _$ShapeMissionModelCopyWithImpl<$Res, $Val extends ShapeMissionModel>
    implements $ShapeMissionModelCopyWith<$Res> {
  _$ShapeMissionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShapeMissionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? targetVertices = null,
    Object? description = freezed,
    Object? difficulty = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            targetVertices: null == targetVertices
                ? _value.targetVertices
                : targetVertices // ignore: cast_nullable_to_non_nullable
                      as List<List<double>>,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            difficulty: null == difficulty
                ? _value.difficulty
                : difficulty // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShapeMissionModelImplCopyWith<$Res>
    implements $ShapeMissionModelCopyWith<$Res> {
  factory _$$ShapeMissionModelImplCopyWith(
    _$ShapeMissionModelImpl value,
    $Res Function(_$ShapeMissionModelImpl) then,
  ) = __$$ShapeMissionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String type,
    List<List<double>> targetVertices,
    String? description,
    int difficulty,
  });
}

/// @nodoc
class __$$ShapeMissionModelImplCopyWithImpl<$Res>
    extends _$ShapeMissionModelCopyWithImpl<$Res, _$ShapeMissionModelImpl>
    implements _$$ShapeMissionModelImplCopyWith<$Res> {
  __$$ShapeMissionModelImplCopyWithImpl(
    _$ShapeMissionModelImpl _value,
    $Res Function(_$ShapeMissionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShapeMissionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? targetVertices = null,
    Object? description = freezed,
    Object? difficulty = null,
  }) {
    return _then(
      _$ShapeMissionModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        targetVertices: null == targetVertices
            ? _value._targetVertices
            : targetVertices // ignore: cast_nullable_to_non_nullable
                  as List<List<double>>,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        difficulty: null == difficulty
            ? _value.difficulty
            : difficulty // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShapeMissionModelImpl implements _ShapeMissionModel {
  const _$ShapeMissionModelImpl({
    required this.id,
    required this.name,
    required this.type,
    required final List<List<double>> targetVertices,
    this.description,
    this.difficulty = 1,
  }) : _targetVertices = targetVertices;

  factory _$ShapeMissionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShapeMissionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  final List<List<double>> _targetVertices;
  @override
  List<List<double>> get targetVertices {
    if (_targetVertices is EqualUnmodifiableListView) return _targetVertices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetVertices);
  }

  @override
  final String? description;
  @override
  @JsonKey()
  final int difficulty;

  @override
  String toString() {
    return 'ShapeMissionModel(id: $id, name: $name, type: $type, targetVertices: $targetVertices, description: $description, difficulty: $difficulty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShapeMissionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(
              other._targetVertices,
              _targetVertices,
            ) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    type,
    const DeepCollectionEquality().hash(_targetVertices),
    description,
    difficulty,
  );

  /// Create a copy of ShapeMissionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShapeMissionModelImplCopyWith<_$ShapeMissionModelImpl> get copyWith =>
      __$$ShapeMissionModelImplCopyWithImpl<_$ShapeMissionModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ShapeMissionModelImplToJson(this);
  }
}

abstract class _ShapeMissionModel implements ShapeMissionModel {
  const factory _ShapeMissionModel({
    required final String id,
    required final String name,
    required final String type,
    required final List<List<double>> targetVertices,
    final String? description,
    final int difficulty,
  }) = _$ShapeMissionModelImpl;

  factory _ShapeMissionModel.fromJson(Map<String, dynamic> json) =
      _$ShapeMissionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get type;
  @override
  List<List<double>> get targetVertices;
  @override
  String? get description;
  @override
  int get difficulty;

  /// Create a copy of ShapeMissionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShapeMissionModelImplCopyWith<_$ShapeMissionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShapeResultModel _$ShapeResultModelFromJson(Map<String, dynamic> json) {
  return _ShapeResultModel.fromJson(json);
}

/// @nodoc
mixin _$ShapeResultModel {
  String get runRecordId => throw _privateConstructorUsedError;
  String get missionId => throw _privateConstructorUsedError;
  double get similarityScore => throw _privateConstructorUsedError;
  bool get isPassed => throw _privateConstructorUsedError;
  DateTime get completedAt => throw _privateConstructorUsedError;
  String? get grade => throw _privateConstructorUsedError;

  /// Serializes this ShapeResultModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShapeResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShapeResultModelCopyWith<ShapeResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShapeResultModelCopyWith<$Res> {
  factory $ShapeResultModelCopyWith(
    ShapeResultModel value,
    $Res Function(ShapeResultModel) then,
  ) = _$ShapeResultModelCopyWithImpl<$Res, ShapeResultModel>;
  @useResult
  $Res call({
    String runRecordId,
    String missionId,
    double similarityScore,
    bool isPassed,
    DateTime completedAt,
    String? grade,
  });
}

/// @nodoc
class _$ShapeResultModelCopyWithImpl<$Res, $Val extends ShapeResultModel>
    implements $ShapeResultModelCopyWith<$Res> {
  _$ShapeResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShapeResultModel
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
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShapeResultModelImplCopyWith<$Res>
    implements $ShapeResultModelCopyWith<$Res> {
  factory _$$ShapeResultModelImplCopyWith(
    _$ShapeResultModelImpl value,
    $Res Function(_$ShapeResultModelImpl) then,
  ) = __$$ShapeResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String runRecordId,
    String missionId,
    double similarityScore,
    bool isPassed,
    DateTime completedAt,
    String? grade,
  });
}

/// @nodoc
class __$$ShapeResultModelImplCopyWithImpl<$Res>
    extends _$ShapeResultModelCopyWithImpl<$Res, _$ShapeResultModelImpl>
    implements _$$ShapeResultModelImplCopyWith<$Res> {
  __$$ShapeResultModelImplCopyWithImpl(
    _$ShapeResultModelImpl _value,
    $Res Function(_$ShapeResultModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShapeResultModel
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
      _$ShapeResultModelImpl(
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
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShapeResultModelImpl implements _ShapeResultModel {
  const _$ShapeResultModelImpl({
    required this.runRecordId,
    required this.missionId,
    required this.similarityScore,
    required this.isPassed,
    required this.completedAt,
    this.grade,
  });

  factory _$ShapeResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShapeResultModelImplFromJson(json);

  @override
  final String runRecordId;
  @override
  final String missionId;
  @override
  final double similarityScore;
  @override
  final bool isPassed;
  @override
  final DateTime completedAt;
  @override
  final String? grade;

  @override
  String toString() {
    return 'ShapeResultModel(runRecordId: $runRecordId, missionId: $missionId, similarityScore: $similarityScore, isPassed: $isPassed, completedAt: $completedAt, grade: $grade)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShapeResultModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of ShapeResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShapeResultModelImplCopyWith<_$ShapeResultModelImpl> get copyWith =>
      __$$ShapeResultModelImplCopyWithImpl<_$ShapeResultModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ShapeResultModelImplToJson(this);
  }
}

abstract class _ShapeResultModel implements ShapeResultModel {
  const factory _ShapeResultModel({
    required final String runRecordId,
    required final String missionId,
    required final double similarityScore,
    required final bool isPassed,
    required final DateTime completedAt,
    final String? grade,
  }) = _$ShapeResultModelImpl;

  factory _ShapeResultModel.fromJson(Map<String, dynamic> json) =
      _$ShapeResultModelImpl.fromJson;

  @override
  String get runRecordId;
  @override
  String get missionId;
  @override
  double get similarityScore;
  @override
  bool get isPassed;
  @override
  DateTime get completedAt;
  @override
  String? get grade;

  /// Create a copy of ShapeResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShapeResultModelImplCopyWith<_$ShapeResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
