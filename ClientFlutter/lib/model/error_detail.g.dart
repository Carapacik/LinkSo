// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDetail _$ErrorDetailFromJson(Map<String, dynamic> json) => ErrorDetail(
      status: json['status'] as int,
      detail: json['detail'] as String,
    );

Map<String, dynamic> _$ErrorDetailToJson(ErrorDetail instance) => <String, dynamic>{
      'status': instance.status,
      'detail': instance.detail,
    };
