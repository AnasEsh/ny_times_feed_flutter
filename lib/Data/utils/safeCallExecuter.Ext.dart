import 'package:dio/dio.dart';
import 'package:nytimes_feed/Data/utils/exceptionMapper.dart';
import 'package:nytimes_feed/Domain/Exceptions/customException.dart';
import "package:dartz/dartz.dart";

extension SafeCallExecution<T> on Future<T> Function() {
  Future<Either<CustomException, T>> executeSafely() async {
    try {
      final result = await this();
      return Right(result);
    } catch (e) {
      if (e is CustomException) return Left(e);

      return Left(mapToCustomException(e));
    }
  }
}
