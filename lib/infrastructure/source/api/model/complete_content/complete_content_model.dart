import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user_model.dart';

part 'complete_content_model.freezed.dart';
part 'complete_content_model.g.dart';

@freezed
class ApiContentModel with _$ApiContentModel {
  const factory ApiContentModel({
    required String id,
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
  }) = _ApiContentModel;

  factory ApiContentModel.fromJson(Map<String, dynamic> json) =>
      _$ApiContentModelFromJson(json);
}
