import 'package:dio/dio.dart';

class Authinterceptor extends Interceptor {
  static const API_KEY = "HJ4NSNsgW6GhtV99Y8kLtnAgNS8eHA2P";
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _addApiKey(options);
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }

  void _addApiKey(RequestOptions options) {
    options.queryParameters["api-key"] = API_KEY;
  }
}
