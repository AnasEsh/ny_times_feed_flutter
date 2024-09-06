import 'package:flutter/material.dart';
import 'package:nytimes_feed/Domain/Entities/article.dart';
import 'package:nytimes_feed/Presentation/views/articlesList/widgets/articleTile.dart';

class Articleslist extends StatelessWidget {
  final List<Article> articles;
  final void Function(Article) onArticleClicked;
  const Articleslist(
      {super.key, required this.articles, required this.onArticleClicked});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, i) => ArticleTile(
        article: articles[i],
        onTap: onArticleClicked,
      ),
      separatorBuilder: (_, __) => SizedBox(height: 10),
      itemCount: articles.length,
    );
  }
}
