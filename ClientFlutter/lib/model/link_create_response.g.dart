// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_create_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkCreateResponse _$LinkCreateResponseFromJson(Map<String, dynamic> json) => LinkCreateResponse(
      key: json['key'] as String,
      target: json['target'] as String,
      linkType: json['linkType'] as int? ?? 0,
    );

Map<String, dynamic> _$LinkCreateResponseToJson(LinkCreateResponse instance) => <String, dynamic>{
      'key': instance.key,
      'target': instance.target,
      'linkType': instance.linkType,
    };
