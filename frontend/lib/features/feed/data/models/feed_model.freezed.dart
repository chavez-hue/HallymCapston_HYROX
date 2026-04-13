// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FeedModel _$FeedModelFromJson(Map<String, dynamic> json) {
  return _FeedModel.fromJson(json);
}

/// @nodoc
mixin _$FeedModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String? get userPhotoUrl => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get runRecordId => throw _privateConstructorUsedError;
  String? get shapeImageUrl => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  bool get isLikedByMe => throw _privateConstructorUsedError;

  /// Serializes this FeedModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedModelCopyWith<FeedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedModelCopyWith<$Res> {
  factory $FeedModelCopyWith(FeedModel value, $Res Function(FeedModel) then) =
      _$FeedModelCopyWithImpl<$Res, FeedModel>;
  @useResult
  $Res call({
    String id,
    String userId,
    String userName,
    String? userPhotoUrl,
    String content,
    DateTime createdAt,
    String? runRecordId,
    String? shapeImageUrl,
    int likeCount,
    bool isLikedByMe,
  });
}

/// @nodoc
class _$FeedModelCopyWithImpl<$Res, $Val extends FeedModel>
    implements $FeedModelCopyWith<$Res> {
  _$FeedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? userPhotoUrl = freezed,
    Object? content = null,
    Object? createdAt = null,
    Object? runRecordId = freezed,
    Object? shapeImageUrl = freezed,
    Object? likeCount = null,
    Object? isLikedByMe = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
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
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            runRecordId: freezed == runRecordId
                ? _value.runRecordId
                : runRecordId // ignore: cast_nullable_to_non_nullable
                      as String?,
            shapeImageUrl: freezed == shapeImageUrl
                ? _value.shapeImageUrl
                : shapeImageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            likeCount: null == likeCount
                ? _value.likeCount
                : likeCount // ignore: cast_nullable_to_non_nullable
                      as int,
            isLikedByMe: null == isLikedByMe
                ? _value.isLikedByMe
                : isLikedByMe // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FeedModelImplCopyWith<$Res>
    implements $FeedModelCopyWith<$Res> {
  factory _$$FeedModelImplCopyWith(
    _$FeedModelImpl value,
    $Res Function(_$FeedModelImpl) then,
  ) = __$$FeedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String userName,
    String? userPhotoUrl,
    String content,
    DateTime createdAt,
    String? runRecordId,
    String? shapeImageUrl,
    int likeCount,
    bool isLikedByMe,
  });
}

/// @nodoc
class __$$FeedModelImplCopyWithImpl<$Res>
    extends _$FeedModelCopyWithImpl<$Res, _$FeedModelImpl>
    implements _$$FeedModelImplCopyWith<$Res> {
  __$$FeedModelImplCopyWithImpl(
    _$FeedModelImpl _value,
    $Res Function(_$FeedModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? userPhotoUrl = freezed,
    Object? content = null,
    Object? createdAt = null,
    Object? runRecordId = freezed,
    Object? shapeImageUrl = freezed,
    Object? likeCount = null,
    Object? isLikedByMe = null,
  }) {
    return _then(
      _$FeedModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
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
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        runRecordId: freezed == runRecordId
            ? _value.runRecordId
            : runRecordId // ignore: cast_nullable_to_non_nullable
                  as String?,
        shapeImageUrl: freezed == shapeImageUrl
            ? _value.shapeImageUrl
            : shapeImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        likeCount: null == likeCount
            ? _value.likeCount
            : likeCount // ignore: cast_nullable_to_non_nullable
                  as int,
        isLikedByMe: null == isLikedByMe
            ? _value.isLikedByMe
            : isLikedByMe // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedModelImpl implements _FeedModel {
  const _$FeedModelImpl({
    required this.id,
    required this.userId,
    required this.userName,
    this.userPhotoUrl,
    required this.content,
    required this.createdAt,
    this.runRecordId,
    this.shapeImageUrl,
    this.likeCount = 0,
    this.isLikedByMe = false,
  });

  factory _$FeedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String? userPhotoUrl;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final String? runRecordId;
  @override
  final String? shapeImageUrl;
  @override
  @JsonKey()
  final int likeCount;
  @override
  @JsonKey()
  final bool isLikedByMe;

  @override
  String toString() {
    return 'FeedModel(id: $id, userId: $userId, userName: $userName, userPhotoUrl: $userPhotoUrl, content: $content, createdAt: $createdAt, runRecordId: $runRecordId, shapeImageUrl: $shapeImageUrl, likeCount: $likeCount, isLikedByMe: $isLikedByMe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userPhotoUrl, userPhotoUrl) ||
                other.userPhotoUrl == userPhotoUrl) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.runRecordId, runRecordId) ||
                other.runRecordId == runRecordId) &&
            (identical(other.shapeImageUrl, shapeImageUrl) ||
                other.shapeImageUrl == shapeImageUrl) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.isLikedByMe, isLikedByMe) ||
                other.isLikedByMe == isLikedByMe));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    userName,
    userPhotoUrl,
    content,
    createdAt,
    runRecordId,
    shapeImageUrl,
    likeCount,
    isLikedByMe,
  );

  /// Create a copy of FeedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedModelImplCopyWith<_$FeedModelImpl> get copyWith =>
      __$$FeedModelImplCopyWithImpl<_$FeedModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedModelImplToJson(this);
  }
}

abstract class _FeedModel implements FeedModel {
  const factory _FeedModel({
    required final String id,
    required final String userId,
    required final String userName,
    final String? userPhotoUrl,
    required final String content,
    required final DateTime createdAt,
    final String? runRecordId,
    final String? shapeImageUrl,
    final int likeCount,
    final bool isLikedByMe,
  }) = _$FeedModelImpl;

  factory _FeedModel.fromJson(Map<String, dynamic> json) =
      _$FeedModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String? get userPhotoUrl;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  String? get runRecordId;
  @override
  String? get shapeImageUrl;
  @override
  int get likeCount;
  @override
  bool get isLikedByMe;

  /// Create a copy of FeedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedModelImplCopyWith<_$FeedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
