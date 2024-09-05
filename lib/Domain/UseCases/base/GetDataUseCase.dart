import 'package:dartz/dartz.dart';
import 'package:nytimes_feed/Domain/Exceptions/customException.dart';

abstract class GetDataUseCase<T> {
  Future<Either<CustomException, T>> execute();
}
