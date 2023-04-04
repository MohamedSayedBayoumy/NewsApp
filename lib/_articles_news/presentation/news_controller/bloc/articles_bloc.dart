import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/core/utils/enum.dart';

import '../../../domain/news_base_use_case/use_case_aritcles.dart';
import 'articles_event.dart';
import 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc(this.useCaseArticles) : super(ArticlesState()) {
    on<FetchArticleDataEvent>(_fetchDataEvent);
  }

  final UseCaseArticles useCaseArticles;

  Future<FutureOr<void>> _fetchDataEvent(
      FetchArticleDataEvent event, Emitter<ArticlesState> emit) async {
    emit(state.copyWith(request: Request.loading));
    final data = await useCaseArticles.getArticlesData();
    if (data.status == "error") {
      emit(state.copyWith(request: Request.error));
    } else {
      emit(state.copyWith(articlesModel: data, request: Request.loaded));
    }
  }
}
