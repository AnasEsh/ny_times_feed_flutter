import 'package:dio/dio.dart';
import 'package:nytimes_feed/Common/DI.dart';
import 'package:nytimes_feed/Data/Constants/endpoints.dart';
import 'package:nytimes_feed/Data/Network/interceptors/authInterceptor.dart';

void injectDio() {
  final dioClient = Dio(BaseOptions(baseUrl: Endpoints.NY_TIMES_BASE_URL));
  dioClient.interceptors.add(Authinterceptor());
  DI.registerSingleton(dioClient);
}
