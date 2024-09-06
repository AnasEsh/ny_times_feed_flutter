import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes_feed/Presentation/bloc/most_popular_articles_bloc.dart';
import 'package:nytimes_feed/Presentation/views/articleDetails/articleDetailsScreen.dart';
import 'package:nytimes_feed/Presentation/views/articleDetails/widgets/articleDetails.dart';
import 'package:nytimes_feed/Presentation/views/articleDetails/widgets/focusedArticleAware.dart';
import 'package:nytimes_feed/Presentation/views/articlesList/widgets/articlesList.dart';
import 'package:nytimes_feed/Presentation/views/home/widgets/error.dart';
import 'package:nytimes_feed/Presentation/views/home/widgets/homeAppBar.dart';
import 'package:nytimes_feed/Presentation/views/home/widgets/loading.dart';
import 'package:nytimes_feed/Presentation/views/layoutConstrains.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final articlesBloc = MostPopularArticlesBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      articlesBloc.add(InitLoadArticles());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => articlesBloc,
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: BlocBuilder<MostPopularArticlesBloc, MostPopularArticlesState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case MostPopularArticlesLoading:
                return SizedBox(
                    width: double.infinity, child: homeLoading(context));
              case MostPopularArticlesError:
                return SizedBox(
                    width: double.infinity, child: homeError(context));
              case MostPopularArticlesLoaded:
                return _responsiveLayout();
              default:
                return const Text("Unexpected state");
            }
          },
        ),
      ),
    );
  }

  LayoutBuilder _responsiveLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final showSide = constraints.maxWidth > widthThreshold;
        final articlesWidget = _articlesList(context);
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
                          (BlocProvider.of<MostPopularArticlesBloc>(context)
                                  .state as MostPopularArticlesLoaded)
                              .articles[0]),
                ),
              )
            ]
          ],
        );
      },
    );
  }

  Widget _articlesList(BuildContext context) {
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
}
