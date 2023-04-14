// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/_articles_news/domain/news_entites/entites_articles.dart';
import 'package:news_app_clean_architecture/core/utils/enum.dart';

import '../../../domain/news_base_use_case/use_case_aritcles.dart';
import 'articles_event.dart';
import 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc(this.useCaseArticles) : super(const ArticlesState()) {
    on<FetchArticleDataEvent>(_fetchDataEvent);
  }

  final UseCaseArticles useCaseArticles;

  Future<FutureOr<void>> _fetchDataEvent(
      FetchArticleDataEvent event, Emitter<ArticlesState> emit) async {
    final remoteData =
        await useCaseArticles.getArticlesData(from: event.from, to: event.to);
    final localArticlesData = await useCaseArticles.getLocalArticlesData();
    print("Mohamed : $remoteData");
    if (state.request == Request.loading) {
      if (remoteData == []) {
        emit(state.copyWith(
            localData: localArticlesData, request: Request.error));
      } else {
        emit(
            state.copyWith(articlesModel: remoteData, request: Request.loaded));
      }
    } else {
      emit(state.copyWith(
          articlesModel: List.of(state.articlesModel)..addAll(remoteData),
          request: Request.loaded));
    }
  }
}
