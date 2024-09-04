import 'package:dio/dio.dart';
import 'package:nytimes_feed/Common/DI.dart';

class RepositoryImplBase {
  final httpClient = DI.get<Dio>();
}
