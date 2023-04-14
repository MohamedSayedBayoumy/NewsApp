// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/core/utils/enum.dart';

import '../../../domain/news_base_use_case/use_case_aritcles.dart';
import 'articles_event.dart';
import 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc(this.useCaseArticles) : super(const ArticlesState()) {
    on<FetchArticleDataEvent>(_fetchDataEvent, transformer: droppable());
  }

  final UseCaseArticles useCaseArticles;

  Future<FutureOr<void>> _fetchDataEvent(
      FetchArticleDataEvent event, Emitter<ArticlesState> emit) async {
    final remoteData =
        await useCaseArticles.getArticlesData(from: event.from, to: event.to);
    final localArticlesData = await useCaseArticles.getLocalArticlesData();
    if (state.request == Request.loading) {
      if (remoteData.isEmpty) {
         if (localArticlesData.isEmpty) {
           emit(state.copyWith(
            localData: localArticlesData,
            noMorePosts: false,
            request: Request.error));
         }
        emit(state.copyWith(
            localData: localArticlesData,
            noMorePosts: false,
            request: Request.offline));
       
      } else {
        emit(state.copyWith(
            articlesModel: remoteData,
            noMorePosts: false,
            request: Request.loaded));
      }
    } else {
      remoteData.length < 11
          ? emit(state.copyWith(
              articlesModel: List.of(state.articlesModel)..addAll(remoteData),
              noMorePosts: true,
              request: Request.loaded))
          : emit(state.copyWith(
              noMorePosts: false,
              articlesModel: List.of(state.articlesModel)..addAll(remoteData),
              request: Request.loaded));
    }
  }
}
