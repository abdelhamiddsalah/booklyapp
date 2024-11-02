import 'package:json_annotation/json_annotation.dart';

part 'api_errors.g.dart';

@JsonSerializable()
class ErrorHandler {
  final ApiError? error;

  ErrorHandler({this.error});

  factory ErrorHandler.fromJson(Map<String, dynamic> json) => _$ErrorHandlerFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorHandlerToJson(this);
}

@JsonSerializable()
class ApiError {
  final int? code;
  final String? message;
  final List<ErrorDetail>? errors;

  ApiError({this.code, this.message, this.errors});

  factory ApiError.fromJson(Map<String, dynamic> json) => _$ApiErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);
}

@JsonSerializable()
class ErrorDetail {
  final String? message;
  final String? domain;
  final String? reason;

  ErrorDetail({this.message, this.domain, this.reason});

  factory ErrorDetail.fromJson(Map<String, dynamic> json) => _$ErrorDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDetailToJson(this);
}
