import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xflutter/blocs/article/article_event.dart';
import 'package:xflutter/blocs/article/article_state.dart';
import 'package:xflutter/model/article_model.dart';
import 'package:xflutter/repository/repositories.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final FetchDataRepository _fetchDataRepository;

  ArticleBloc(this._fetchDataRepository) : super(ArticleLoadingState()) {
    on<LoadArticleEvent>((event, emit) async {
      emit(ArticleLoadingState());
      try {
        final List<Articles> articles =
            await _fetchDataRepository.getNewFeeds();

        emit(ArticleLoadedState(articles));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}
