import 'package:dio/dio.dart';

class CustomException implements Exception {
  String friendlyMessage;
  bool retryable;
  Response? _response;
  // int? get requtatusCode => _response?.statusCode;
  Exception innerException;
  CustomException({
    required this.friendlyMessage,
    required this.innerException,
    this.retryable = false,
    Response? response,
  }) : _response = response;
}
