// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkCreateRequest _$LinkCreateRequestFromJson(Map<String, dynamic> json) => LinkCreateRequest(
      target: json['target'] as String,
      linkType: json['linkType'] as int? ?? 0,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LinkCreateRequestToJson(LinkCreateRequest instance) => <String, dynamic>{
      'target': instance.target,
      'linkType': instance.linkType,
      'password': instance.password,
    };
