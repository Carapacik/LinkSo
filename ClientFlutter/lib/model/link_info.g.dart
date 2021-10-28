// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkInfo _$LinkInfoFromJson(Map<String, dynamic> json) => LinkInfo(
      target: json['target'] as String,
      linkType: json['linkType'] as int? ?? 0,
      key: json['key'] as String,
    );

Map<String, dynamic> _$LinkInfoToJson(LinkInfo instance) => <String, dynamic>{
      'target': instance.target,
      'linkType': instance.linkType,
      'key': instance.key,
    };
