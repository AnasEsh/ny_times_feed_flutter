import 'package:dartz/dartz.dart';
import 'package:nytimes_feed/Common/DI.dart';
import 'package:nytimes_feed/Data/utils/safeCallExecuter.Ext.dart';
import 'package:nytimes_feed/Domain/Entities/article.dart';
import 'package:nytimes_feed/Domain/Exceptions/customException.dart';
import 'package:nytimes_feed/Domain/Repositories/articlesRepository.dart';
import 'package:nytimes_feed/Domain/UseCases/base/GetDataUseCase.dart';

class GetPopularArticlesUseCase implements GetDataUseCase<List<Article>> {
  final _repo = DI.get<ArticlesRepository>();

  @override
  Future<Either<CustomException, List<Article>>> execute() async =>
      _repo.getMostPopularArticles.executeSafely();
}
