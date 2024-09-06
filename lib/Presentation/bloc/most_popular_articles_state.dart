part of 'most_popular_articles_bloc.dart';

@immutable
sealed class MostPopularArticlesState {}

final class MostPopularArticlesInitial extends MostPopularArticlesState {}

final class MostPopularArticlesLoading extends MostPopularArticlesState {}

final class MostPopularArticlesLoaded extends MostPopularArticlesState {
  final List<Article> articles;
  MostPopularArticlesLoaded(this.articles);
}

final class MostPopularArticlesError extends MostPopularArticlesState {
  final CustomException failure;

  MostPopularArticlesError(this.failure);
}
