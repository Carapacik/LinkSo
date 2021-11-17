// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_validation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorValidation _$ErrorValidationFromJson(Map<String, dynamic> json) =>
    ErrorValidation(
      message: json['message'] as String,
      invalidFields: (json['invalidFields'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ErrorValidationToJson(ErrorValidation instance) =>
    <String, dynamic>{
      'message': instance.message,
      'invalidFields': instance.invalidFields,
    };
