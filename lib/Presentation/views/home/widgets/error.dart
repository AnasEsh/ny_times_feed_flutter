import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes_feed/Presentation/bloc/most_popular_articles_bloc.dart';

Column homeError(BuildContext context) {
  final articlesBloc = BlocProvider.of<MostPopularArticlesBloc>(context);
  final err = (articlesBloc.state as MostPopularArticlesError).failure;
  final icon = Icon(err.retryable ? Icons.refresh : Icons.warning);
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      if (err.retryable)
        IconButton(
            onPressed: () {
              articlesBloc.add(InitLoadArticles());
            },
            icon: icon)
      else
        icon,
      SizedBox(
        height: 15,
      ),
      Text(err.friendlyMessage),
    ],
  );
}
