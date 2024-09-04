import 'package:dio/dio.dart';

extension DioErrorRetryPossibility on DioException {
  static const Map<DioExceptionType, bool> _retryableErrors = {
    DioExceptionType.connectionTimeout: true,
    DioExceptionType.sendTimeout: true,
    DioExceptionType.receiveTimeout: true,
    DioExceptionType.cancel: true,
    DioExceptionType.connectionError: true,
    DioExceptionType.badCertificate: false,
    DioExceptionType.badResponse: false,
  };

  bool get isDioReqRetryable {
    if (response?.statusCode == 500) return false;

    return _retryableErrors[type] ?? true;
  }
}

extension DioErrorBeautifiers on DioException {
  static const Map<DioExceptionType, String> _errorMessages = {
    DioExceptionType.connectionTimeout: "Server is not responding",
    DioExceptionType.sendTimeout: "send timeout",
    DioExceptionType.receiveTimeout: "receive timeout",
    DioExceptionType.badCertificate: "bad certificate",
    DioExceptionType.badResponse: "bad request",
    DioExceptionType.cancel: "request cancelled",
    DioExceptionType.connectionError: "connection error",
  };

  String get dioFriendlyException {
    if (response?.statusCode == 500) return "Server side error occured";

    final errorMessage = _errorMessages[type];
    return errorMessage ?? message ?? "Unknown network error occured";
  }
}
