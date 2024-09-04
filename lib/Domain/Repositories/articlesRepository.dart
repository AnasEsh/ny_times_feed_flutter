import 'package:nytimes_feed/Domain/Entities/article.dart';

abstract class ArticlesRepository {
  Future<List<Article>> getMostPopularArticles();
}
