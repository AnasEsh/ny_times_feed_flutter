import 'package:dio/dio.dart';
import 'package:nytimes_feed/Common/DI.dart';
import 'package:nytimes_feed/Data/Constants/endpoints.dart';
import 'package:nytimes_feed/Data/Repositories/base.dart';
import 'package:nytimes_feed/Domain/Entities/article.dart';
import 'package:nytimes_feed/Domain/Exceptions/customException.dart';
import 'package:nytimes_feed/Domain/Repositories/articlesRepository.dart';

class Articlesrepositoryimpl extends RepositoryImplBase
    implements ArticlesRepository {
  @override
  Future<List<Article>> getMostPopularArticles() async {
    final response = await httpClient
        .get<Map<String, dynamic>>(Endpoints.NY_MOST_POPULAR_ARTICLES);
    final List<Article> mapped = [
      ...?response.data?["results"]
          ?.map((serialized) => Article.fromJson(serialized))
          .toList()
    ];

    return mapped;
  }
}
