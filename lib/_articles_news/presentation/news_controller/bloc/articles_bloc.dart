// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:translator/translator.dart';

import '../../../../core/utils/enum.dart';
import '../../../domain/news_base_use_case/use_case_aritcles.dart';
import 'articles_event.dart';
import 'articles_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc(this.useCaseArticles) : super(const ArticlesState()) {
    on<FetchArticleDataEvent>(_fetchDataEvent, transformer: droppable());
    on<TranslateArticleDataEvent>(
      _franslateArticleDataEvent,
    );
  }

  final UseCaseArticles useCaseArticles;

  Future<FutureOr<void>> _fetchDataEvent(
      FetchArticleDataEvent event, Emitter<ArticlesState> emit) async {
    if (state.request == Request.loading) {
      final remoteData = await useCaseArticles.getArticlesData();
      // final localArticlesData = await useCaseArticles.getLocalArticlesData();

      // Online State
      if (remoteData.isNotEmpty) {
        emit(
            state.copyWith(articlesModel: remoteData, request: Request.loaded));
      }

      // OFFline State
      if (remoteData.isEmpty) {
        emit(state.copyWith(
            // localData: localArticlesData,
            noMorePosts: false,
            request: Request.offline));
      }

      // If network fail after login ...
      // if (localArticlesData.isEmpty) {
      //   emit(state.copyWith(request: Request.error));
      // }
    } else {
      final remoteData = await useCaseArticles.getArticlesData(
          from: state.articlesModel.length);
      if (remoteData.isEmpty) {
        print("No More Data : ${state.articlesModel.length}");

        emit(state.copyWith(noMorePosts: true, request: Request.loaded));
      } else {
        print("More Data : ${state.articlesModel.length}");
        emit(state.copyWith(
            noMorePosts: false,
            articlesModel: List.of(state.articlesModel)..addAll(remoteData),
            request: Request.loaded));
      }
    }
  }

  Future<FutureOr<void>> _franslateArticleDataEvent(
      TranslateArticleDataEvent event, Emitter<ArticlesState> emit) async {
    emit(state.copyWith(
      request: state.request,
      index: event.indexItem,
      titleAr: "",
      descripationAr: "",
      isLoading: true,
      showTranslation: false,
    ));
    try {
      final translator = GoogleTranslator();

      final translateTitle =
          await translator.translate(event.title.toString(), to: 'ar');
      final translateDescripation =
          await translator.translate(event.description.toString(), to: 'ar');

      emit(state.copyWith(
        request: state.request,
        index: event.indexItem,
        isLoading: false,
        showTranslation: true,
        titleAr: translateTitle.toString(),
        descripationAr: translateDescripation.toString(),
      ));
    } on DioError {
      emit(state.copyWith(
        request: state.request,
        index: event.indexItem,
        isLoading: false,
        showTranslation: true,
        titleAr: AppLocalizations.of(event.context)!.checkYourConnections,
        descripationAr: "",
      ));
    } catch (e) {
      emit(state.copyWith(
        request: state.request,
        index: event.indexItem,
        isLoading: false,
        showTranslation: true,
        titleAr: AppLocalizations.of(event.context)!.checkYourConnections,
        descripationAr: "",
      ));
    }
  }
}
