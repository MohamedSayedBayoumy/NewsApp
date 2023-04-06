import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
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
    emit(state.copyWith(request: Request.loading));
    final remoteData = await useCaseArticles.getArticlesData();
    final localArticlesData = await useCaseArticles.getLocalArticlesData();

    remoteData.fold((l) {
      emit(
          state.copyWith(request: Request.error, localData: localArticlesData));
    }, (r) {
      emit(state.copyWith(articlesModel: r, request: Request.loaded));
    });
  }
}
