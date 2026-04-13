// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shape_mission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ShapeMission {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ShapeType get type => throw _privateConstructorUsedError;
  List<List<double>> get targetVertices =>
      throw _privateConstructorUsedError; // normalized [x, y] pairs
  String? get description => throw _privateConstructorUsedError;
  int get difficulty => throw _privateConstructorUsedError;

  /// Create a copy of ShapeMission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShapeMissionCopyWith<ShapeMission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShapeMissionCopyWith<$Res> {
  factory $ShapeMissionCopyWith(
    ShapeMission value,
    $Res Function(ShapeMission) then,
  ) = _$ShapeMissionCopyWithImpl<$Res, ShapeMission>;
  @useResult
  $Res call({
    String id,
    String name,
    ShapeType type,
    List<List<double>> targetVertices,
    String? description,
    int difficulty,
  });
}

/// @nodoc
class _$ShapeMissionCopyWithImpl<$Res, $Val extends ShapeMission>
    implements $ShapeMissionCopyWith<$Res> {
  _$ShapeMissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShapeMission
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
                      as ShapeType,
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
abstract class _$$ShapeMissionImplCopyWith<$Res>
    implements $ShapeMissionCopyWith<$Res> {
  factory _$$ShapeMissionImplCopyWith(
    _$ShapeMissionImpl value,
    $Res Function(_$ShapeMissionImpl) then,
  ) = __$$ShapeMissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    ShapeType type,
    List<List<double>> targetVertices,
    String? description,
    int difficulty,
  });
}

/// @nodoc
class __$$ShapeMissionImplCopyWithImpl<$Res>
    extends _$ShapeMissionCopyWithImpl<$Res, _$ShapeMissionImpl>
    implements _$$ShapeMissionImplCopyWith<$Res> {
  __$$ShapeMissionImplCopyWithImpl(
    _$ShapeMissionImpl _value,
    $Res Function(_$ShapeMissionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShapeMission
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
      _$ShapeMissionImpl(
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
                  as ShapeType,
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

class _$ShapeMissionImpl implements _ShapeMission {
  const _$ShapeMissionImpl({
    required this.id,
    required this.name,
    required this.type,
    required final List<List<double>> targetVertices,
    this.description,
    this.difficulty = 1,
  }) : _targetVertices = targetVertices;

  @override
  final String id;
  @override
  final String name;
  @override
  final ShapeType type;
  final List<List<double>> _targetVertices;
  @override
  List<List<double>> get targetVertices {
    if (_targetVertices is EqualUnmodifiableListView) return _targetVertices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetVertices);
  }

  // normalized [x, y] pairs
  @override
  final String? description;
  @override
  @JsonKey()
  final int difficulty;

  @override
  String toString() {
    return 'ShapeMission(id: $id, name: $name, type: $type, targetVertices: $targetVertices, description: $description, difficulty: $difficulty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShapeMissionImpl &&
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

  /// Create a copy of ShapeMission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShapeMissionImplCopyWith<_$ShapeMissionImpl> get copyWith =>
      __$$ShapeMissionImplCopyWithImpl<_$ShapeMissionImpl>(this, _$identity);
}

abstract class _ShapeMission implements ShapeMission {
  const factory _ShapeMission({
    required final String id,
    required final String name,
    required final ShapeType type,
    required final List<List<double>> targetVertices,
    final String? description,
    final int difficulty,
  }) = _$ShapeMissionImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  ShapeType get type;
  @override
  List<List<double>> get targetVertices; // normalized [x, y] pairs
  @override
  String? get description;
  @override
  int get difficulty;

  /// Create a copy of ShapeMission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShapeMissionImplCopyWith<_$ShapeMissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
