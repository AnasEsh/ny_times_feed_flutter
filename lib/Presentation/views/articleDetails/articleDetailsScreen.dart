import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes_feed/Domain/Entities/article.dart';
import 'package:nytimes_feed/Presentation/bloc/most_popular_articles_bloc.dart';
import 'package:nytimes_feed/Presentation/views/articleDetails/widgets/articleDetails.dart';
import 'package:nytimes_feed/Presentation/views/layoutConstrains.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Article article;
  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > widthThreshold) _pop(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: ArticleDetails(article: article),
    );
  }

  void _pop(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final nav = Navigator.of(context);
      if (nav.canPop()) nav.pop();
    });
  }
}
