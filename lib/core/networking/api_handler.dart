import 'package:booklyapp/core/networking/apiConstants.dart';
import 'package:dio/dio.dart';

enum DataSource {
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError,
}

class ResponseCode {
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int internalServerError = 500;

  // Local status codes
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -7;
}

class ApiErrorMessage {
  static const String noContent = ApiErrors.noContent;
  static const String badRequest = ApiErrors.badRequestError;
  static const String unauthorized = ApiErrors.unauthorizedError;
  static const String forbidden = ApiErrors.forbiddenError;
  static const String internalServerError = ApiErrors.internalServerError;
  static const String notFound = ApiErrors.notFoundError;
  static const String connectTimeout = ApiErrors.timeoutError;
  static const String cancel = ApiErrors.defaultError;
  static const String receiveTimeout = ApiErrors.timeoutError;
  static const String sendTimeout = ApiErrors.timeoutError;
  static const String cacheError = ApiErrors.cacheError;
  static const String noInternetConnection = ApiErrors.noInternetError;
  static const String defaultError = ApiErrors.defaultError;
}

class ErrorHandler implements Exception {
  final String message;
  final int code;

  ErrorHandler({required this.message, required this.code});

  ErrorHandler.handle(DioException error)
      : message = _getErrorMessage(error),
        code = error.response?.statusCode ?? ResponseCode.defaultError;

  static String _getErrorMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiErrorMessage.connectTimeout;
      case DioExceptionType.sendTimeout:
        return ApiErrorMessage.sendTimeout;
      case DioExceptionType.receiveTimeout:
        return ApiErrorMessage.receiveTimeout;
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        if (statusCode != null) {
          return _getErrorMessageFromStatusCode(statusCode);
        }
        return ApiErrorMessage.defaultError;
      case DioExceptionType.cancel:
        return ApiErrorMessage.cancel;
      case DioExceptionType.connectionError:
        return ApiErrorMessage.noInternetConnection;
      case DioExceptionType.unknown:
      default:
        return ApiErrorMessage.defaultError;
    }
  }

  static String _getErrorMessageFromStatusCode(int statusCode) {
    switch (statusCode) {
      case ResponseCode.noContent:
        return ApiErrorMessage.noContent;
      case ResponseCode.badRequest:
        return ApiErrorMessage.badRequest;
      case ResponseCode.unauthorized:
        return ApiErrorMessage.unauthorized;
      case ResponseCode.forbidden:
        return ApiErrorMessage.forbidden;
      case ResponseCode.notFound:
        return ApiErrorMessage.notFound;
      case ResponseCode.internalServerError:
        return ApiErrorMessage.internalServerError;
      default:
        return ApiErrorMessage.defaultError;
    }
  }

  @override
  String toString() => message;
}
