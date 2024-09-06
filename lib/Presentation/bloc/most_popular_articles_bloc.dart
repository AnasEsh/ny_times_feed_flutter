import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:nytimes_feed/Domain/Entities/article.dart';
import 'package:nytimes_feed/Domain/Exceptions/customException.dart';
import 'package:nytimes_feed/Domain/UseCases/getPopularArticlesUseCase.dart';

part 'most_popular_articles_event.dart';
part 'most_popular_articles_state.dart';

class MostPopularArticlesBloc
    extends Bloc<MostPopularArticlesEvent, MostPopularArticlesState> {
  MostPopularArticlesBloc() : super(MostPopularArticlesInitial()) {
    _handleEvents();
  }

  void _handleEvents() {
    on<InitLoadArticles>((event, emit) async {
      final _useCase = GetPopularArticlesUseCase();
      emit(MostPopularArticlesLoading());
      final data = await _useCase.execute();
      data.fold(
        (error) {
          emit(MostPopularArticlesError(error));
        },
        (articles) {
          emit(MostPopularArticlesLoaded(articles));
        },
      );
    });

    on<ArticleFocused>(
      (event, emit) {
        state.focusedArticle.value = event.article;
      },
    );

    on<ArticleUnfocused>(
      (event, emit) {
        state.focusedArticle.value = null;
      },
    );
  }
}
