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
  @override
  String toString() {
    final data = [
      ("Retryable", retryable),
      ("Friendly Message", friendlyMessage),
      ("type of inner exception", innerException.runtimeType),
      if (_response?.statusCode != null)
        ("response code", _response!.statusCode!)
    ].map((pair) => "${pair.$1}=> ${pair.$2}");

    return "\nCustomException(\n${data.join(",\n")}\n)\n$innerException";
  }
}
