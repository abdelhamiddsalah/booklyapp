// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorHandler _$ErrorHandlerFromJson(Map<String, dynamic> json) => ErrorHandler(
      error: json['error'] == null
          ? null
          : ApiError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ErrorHandlerToJson(ErrorHandler instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) => ApiError(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiErrorToJson(ApiError instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'errors': instance.errors,
    };

ErrorDetail _$ErrorDetailFromJson(Map<String, dynamic> json) => ErrorDetail(
      message: json['message'] as String?,
      domain: json['domain'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$ErrorDetailToJson(ErrorDetail instance) =>
    <String, dynamic>{
      'message': instance.message,
      'domain': instance.domain,
      'reason': instance.reason,
    };
