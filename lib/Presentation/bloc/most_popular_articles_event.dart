part of 'most_popular_articles_bloc.dart';

@immutable
sealed class MostPopularArticlesEvent {}

class InitLoadArticles extends MostPopularArticlesEvent {}

class ArticleFocused extends MostPopularArticlesEvent {
  final Article article;
  ArticleFocused({required this.article});
}

class ArticleUnfocused extends MostPopularArticlesEvent {}
