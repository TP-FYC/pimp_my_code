// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'complete_content_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiContentModel _$ApiContentModelFromJson(Map<String, dynamic> json) {
  return _ApiContentModel.fromJson(json);
}

/// @nodoc
class _$ApiContentModelTearOff {
  const _$ApiContentModelTearOff();

  _ApiContentModel call(
      {required String id,
      String? title,
      required String content,
      String? code,
      String? codeResult,
      @JsonKey(name: 'created_at') required DateTime createdAt,
      @JsonKey(name: 'creator_id') String? creatorId,
      ApiUserModel? creator,
      @JsonKey(name: 'parent_id') String? parentId,
      @JsonKey(name: 'content_type') required String contentType,
      String? username}) {
    return _ApiContentModel(
      id: id,
      title: title,
      content: content,
      code: code,
      codeResult: codeResult,
      createdAt: createdAt,
      creatorId: creatorId,
      creator: creator,
      parentId: parentId,
      contentType: contentType,
      username: username,
      userImage: userImage,
    );
  }

  ApiContentModel fromJson(Map<String, Object?> json) {
    return ApiContentModel.fromJson(json);
  }
}

/// @nodoc
const $ApiContentModel = _$ApiContentModelTearOff();

/// @nodoc
mixin _$ApiContentModel {
  String get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get codeResult => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'creator_id')
  String? get creatorId => throw _privateConstructorUsedError;
  ApiUserModel? get creator => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id')
  String? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_type')
  String get contentType => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get userImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiContentModelCopyWith<ApiContentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiContentModelCopyWith<$Res> {
  factory $ApiContentModelCopyWith(
          ApiContentModel value, $Res Function(ApiContentModel) then) =
      _$ApiContentModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? title,
      String content,
      String? code,
      String? codeResult,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'creator_id') String? creatorId,
      ApiUserModel? creator,
      @JsonKey(name: 'parent_id') String? parentId,
      @JsonKey(name: 'content_type') String contentType,
      String? username,
      String? userImage});

  $ApiUserModelCopyWith<$Res>? get creator;
}

/// @nodoc
class _$ApiContentModelCopyWithImpl<$Res>
    implements $ApiContentModelCopyWith<$Res> {
  _$ApiContentModelCopyWithImpl(this._value, this._then);

  final ApiContentModel _value;
  // ignore: unused_field
  final $Res Function(ApiContentModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? code = freezed,
    Object? codeResult = freezed,
    Object? createdAt = freezed,
    Object? creatorId = freezed,
    Object? creator = freezed,
    Object? parentId = freezed,
    Object? contentType = freezed,
    Object? username = freezed,
    Object? userImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      codeResult: codeResult == freezed
          ? _value.codeResult
          : codeResult // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as ApiUserModel?,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      userImage: userImage == freezed
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ApiUserModelCopyWith<$Res>? get creator {
    if (_value.creator == null) {
      return null;
    }

    return $ApiUserModelCopyWith<$Res>(_value.creator!, (value) {
      return _then(_value.copyWith(creator: value));
    });
  }
}

/// @nodoc
abstract class _$ApiContentModelCopyWith<$Res>
    implements $ApiContentModelCopyWith<$Res> {
  factory _$ApiContentModelCopyWith(
          _ApiContentModel value, $Res Function(_ApiContentModel) then) =
      __$ApiContentModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? title,
      String content,
      String? code,
      String? codeResult,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'creator_id') String? creatorId,
      ApiUserModel? creator,
      @JsonKey(name: 'parent_id') String? parentId,
      @JsonKey(name: 'content_type') String contentType,
      String? username,
      String? userImage});

  @override
  $ApiUserModelCopyWith<$Res>? get creator;
}

/// @nodoc
class __$ApiContentModelCopyWithImpl<$Res>
    extends _$ApiContentModelCopyWithImpl<$Res>
    implements _$ApiContentModelCopyWith<$Res> {
  __$ApiContentModelCopyWithImpl(
      _ApiContentModel _value, $Res Function(_ApiContentModel) _then)
      : super(_value, (v) => _then(v as _ApiContentModel));

  @override
  _ApiContentModel get _value => super._value as _ApiContentModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? code = freezed,
    Object? codeResult = freezed,
    Object? createdAt = freezed,
    Object? creatorId = freezed,
    Object? creator = freezed,
    Object? parentId = freezed,
    Object? contentType = freezed,
    Object? username = freezed,
    Object? userImage = freezed,
  }) {
    return _then(_ApiContentModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      codeResult: codeResult == freezed
          ? _value.codeResult
          : codeResult // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      creatorId: creatorId == freezed
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as ApiUserModel?,
      parentId: parentId == freezed
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      userImage: userImage == freezed
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiContentModel implements _ApiContentModel {
  const _$_ApiContentModel(
      {required this.id,
      this.title,
      required this.content,
      this.code,
      this.codeResult,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'creator_id') this.creatorId,
      this.creator,
      @JsonKey(name: 'parent_id') this.parentId,
      @JsonKey(name: 'content_type') required this.contentType,
      this.username,
      this.userImage});

  factory _$_ApiContentModel.fromJson(Map<String, dynamic> json) =>
      _$$_ApiContentModelFromJson(json);

  @override
  final String id;
  @override
  final String? title;
  @override
  final String content;
  @override
  final String? code;
  @override
  final String? codeResult;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'creator_id')
  final String? creatorId;
  @override
  final ApiUserModel? creator;
  @override
  @JsonKey(name: 'parent_id')
  final String? parentId;
  @override
  @JsonKey(name: 'content_type')
  final String contentType;
  @override
  final String? username;
  @override
  final String? userImage;

  @override
  String toString() {
    return 'ApiContentModel(id: $id, title: $title, content: $content, code: $code, codeResult: $codeResult, createdAt: $createdAt, creatorId: $creatorId, creator: $creator, parentId: $parentId, contentType: $contentType, username: $username, userImage: $userImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApiContentModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.codeResult, codeResult) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.creatorId, creatorId) &&
            const DeepCollectionEquality().equals(other.creator, creator) &&
            const DeepCollectionEquality().equals(other.parentId, parentId) &&
            const DeepCollectionEquality()
                .equals(other.contentType, contentType) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.userImage, userImage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(codeResult),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(creatorId),
      const DeepCollectionEquality().hash(creator),
      const DeepCollectionEquality().hash(parentId),
      const DeepCollectionEquality().hash(contentType),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(userImage));

  @JsonKey(ignore: true)
  @override
  _$ApiContentModelCopyWith<_ApiContentModel> get copyWith =>
      __$ApiContentModelCopyWithImpl<_ApiContentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiContentModelToJson(this);
  }
}

abstract class _ApiContentModel implements ApiContentModel {
  const factory _ApiContentModel(
      {required String id,
      String? title,
      required String content,
      String? code,
      String? codeResult,
      @JsonKey(name: 'created_at') required DateTime createdAt,
      @JsonKey(name: 'creator_id') String? creatorId,
      ApiUserModel? creator,
      @JsonKey(name: 'parent_id') String? parentId,
      @JsonKey(name: 'content_type') required String contentType,
      String? username,
      String? userImage}) = _$_ApiContentModel;

  factory _ApiContentModel.fromJson(Map<String, dynamic> json) =
      _$_ApiContentModel.fromJson;

  @override
  String get id;
  @override
  String? get title;
  @override
  String get content;
  @override
  String? get code;
  @override
  String? get codeResult;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'creator_id')
  String? get creatorId;
  @override
  ApiUserModel? get creator;
  @override
  @JsonKey(name: 'parent_id')
  String? get parentId;
  @override
  @JsonKey(name: 'content_type')
  String get contentType;
  @override
  String? get username;
  @override
  String? get userImage;
  @override
  @JsonKey(ignore: true)
  _$ApiContentModelCopyWith<_ApiContentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
