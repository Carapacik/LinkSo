// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkCreate _$LinkCreateFromJson(Map<String, dynamic> json) => LinkCreate(
      target: json['target'] as String,
      linkType: json['linkType'] as int? ?? 0,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LinkCreateToJson(LinkCreate instance) => <String, dynamic>{
      'target': instance.target,
      'linkType': instance.linkType,
      'password': instance.password,
    };
