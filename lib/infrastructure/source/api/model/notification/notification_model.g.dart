// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiNotificationModel _$$_ApiNotificationModelFromJson(
        Map<String, dynamic> json) =>
    _$_ApiNotificationModel(
      id: json['id'] as String,
      dateHour: DateTime.parse(json['date_hour'] as String),
      isSeen: json['is_seen'] as bool,
      notificationType: json['notification_type'] as String,
      contentLinked: json['content_linked'] as String?,
      userRecipient:
          ApiUserModel.fromJson(json['user_recipient'] as Map<String, dynamic>),
      userLinked: json['user_linked'] == null
          ? null
          : ApiUserModel.fromJson(json['user_linked'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ApiNotificationModelToJson(
        _$_ApiNotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date_hour': instance.dateHour.toIso8601String(),
      'is_seen': instance.isSeen,
      'notification_type': instance.notificationType,
      'content_linked': instance.contentLinked,
      'user_recipient': instance.userRecipient,
      'user_linked': instance.userLinked,
    };
