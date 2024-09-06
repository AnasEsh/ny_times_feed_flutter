import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes_feed/Presentation/bloc/most_popular_articles_bloc.dart';
import 'package:nytimes_feed/Presentation/views/articlesList/widgets/articlesList.dart';
import 'package:nytimes_feed/Presentation/views/home/widgets/error.dart';
import 'package:nytimes_feed/Presentation/views/home/widgets/homeAppBar.dart';
import 'package:nytimes_feed/Presentation/views/home/widgets/loading.dart';

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
                return _articlesList(context);
              default:
                return const Text("Unexpected state");
            }
          },
        ),
      ),
    );
  }

  Widget _articlesList(BuildContext context) {
    final articlesState = articlesBloc.state as MostPopularArticlesLoaded;
    return Articleslist(
        articles: articlesState.articles, onArticleClicked: (_) {});
  }
}
