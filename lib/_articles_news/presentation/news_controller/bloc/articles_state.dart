import 'package:equatable/equatable.dart';

import '../../../../core/utils/enum.dart';
import '../../../domain/news_entites/entites_articles.dart';

class ArticlesState extends Equatable {
  final List<Articles> articlesModel;

  final Request? request;
  final List localData;
  final String titleAr;
  final String descripationAr;
  final bool noMorePosts;
  final bool showTranslation;
  final bool isLoading;
  final int index;

  const ArticlesState(
      {this.articlesModel = const [],
      this.localData = const [],
      this.index = 0,
      this.titleAr = "",
      this.descripationAr = "",
      this.isLoading = false,
      this.showTranslation = false,
      this.noMorePosts = false,
      this.request = Request.loading});

  ArticlesState copyWith({
    List? localData,
    List<Articles>? articlesModel,
    Request? request = Request.loading,
    String? titleAr,
    String? descripationAr,
    bool? noMorePosts,
    bool? showTranslation,
    bool? isLoading,
    int? index,
  }) {
    return ArticlesState(
        isLoading: isLoading ?? this.isLoading,
        index: index ?? this.index,
        titleAr: titleAr ?? this.titleAr,
        showTranslation: showTranslation ?? this.showTranslation,
        descripationAr: descripationAr ?? this.descripationAr,
        noMorePosts: noMorePosts ?? this.noMorePosts,
        localData: localData ?? this.localData,
        request: request ?? this.request,
        articlesModel: articlesModel ?? this.articlesModel);
  }

  @override
  List<Object> get props => [
        request!,
        articlesModel,
        noMorePosts,
        descripationAr,
        showTranslation,
        isLoading
      ];
}
