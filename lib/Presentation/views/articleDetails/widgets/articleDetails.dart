import 'package:flutter/material.dart';
import 'package:nytimes_feed/Domain/Entities/article.dart';

class ArticleDetails extends StatelessWidget {
  final Article article;
  const ArticleDetails({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(article.title), Divider(), Text(article.byline)],
    );
  }
}
