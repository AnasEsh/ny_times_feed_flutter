part of 'most_popular_articles_bloc.dart';

@immutable
sealed class MostPopularArticlesEvent {}

class InitLoadArticles extends MostPopularArticlesEvent {}
