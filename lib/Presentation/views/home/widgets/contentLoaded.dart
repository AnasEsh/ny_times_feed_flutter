import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes_feed/Presentation/bloc/most_popular_articles_bloc.dart';
import 'package:nytimes_feed/Presentation/views/articleDetails/articleDetailsScreen.dart';
import 'package:nytimes_feed/Presentation/views/articleDetails/widgets/articleDetails.dart';
import 'package:nytimes_feed/Presentation/views/articleDetails/widgets/focusedArticleAware.dart';
import 'package:nytimes_feed/Presentation/views/articlesList/widgets/articlesList.dart';
import 'package:nytimes_feed/Presentation/views/layoutConstrains.dart';

LayoutBuilder contentLoaded() {
  return LayoutBuilder(
    builder: (context, constraints) {
      final showSide = constraints.maxWidth > widthThreshold;
      final articlesWidget = articlesList(context);
      return Row(
        children: [
          Container(
            width: showSide ? 300 : constraints.maxWidth,
            child: articlesWidget,
          ),
          if (showSide) ...[
            VerticalDivider(),
            Expanded(
              child: FocusedArticleAware(
                builder: (article) => ArticleDetails(
                    article: article ??
                        (BlocProvider.of<MostPopularArticlesBloc>(context).state
                                as MostPopularArticlesLoaded)
                            .articles[0]),
              ),
            )
          ]
        ],
      );
    },
  );
}

Widget articlesList(BuildContext context) {
  final articlesBloc = BlocProvider.of<MostPopularArticlesBloc>(context);
  final articlesState = articlesBloc.state as MostPopularArticlesLoaded;
  return Articleslist(
      articles: articlesState.articles,
      onArticleClicked: (a) {
        articlesBloc.add(ArticleFocused(article: a));
        if (MediaQuery.of(context).size.width < widthThreshold) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ArticleDetailsScreen(article: a),
          ));
        }
      });
}
