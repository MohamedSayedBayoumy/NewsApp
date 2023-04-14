import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/core/utils/enum.dart';

import '../../../domain/news_entites/entites_articles.dart';

class ArticlesState extends Equatable {
  final List<Articles> articlesModel;
  final bool? isReadOnly;
  final Request? request;
  final List? localData;
  final bool noMorePosts;

  const ArticlesState(
      {this.articlesModel = const [],
      this.isReadOnly = false,
      this.noMorePosts = false,
      this.localData,
      this.request = Request.loading});

  ArticlesState copyWith(
      {bool? isReadOnly,
      List? localData,
      List<Articles>? articlesModel,
      final ScrollController? controller,
      int? countArical,
      bool? noMorePosts,
      Request? request = Request.loading}) {
    return ArticlesState(
        noMorePosts: noMorePosts ?? this.noMorePosts,
        localData: localData ?? this.localData,
        isReadOnly: isReadOnly ?? this.isReadOnly,
        request: request ?? this.request,
        articlesModel: articlesModel ?? this.articlesModel);
  }

  @override
  List<Object> get props => [isReadOnly!, request!, articlesModel ,noMorePosts];
}
