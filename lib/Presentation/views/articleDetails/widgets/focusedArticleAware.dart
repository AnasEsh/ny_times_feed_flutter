import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes_feed/Domain/Entities/article.dart';
import 'package:nytimes_feed/Presentation/bloc/most_popular_articles_bloc.dart';

class FocusedArticleAware extends StatelessWidget {
  final Widget Function(Article?) builder;
  const FocusedArticleAware({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final articlesBloc = BlocProvider.of<MostPopularArticlesBloc>(context);
    return ValueListenableBuilder(
      valueListenable: articlesBloc.state.focusedArticle,
      builder: (context, value, child) => builder(value),
    );
  }
}
