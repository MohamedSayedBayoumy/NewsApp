import 'package:equatable/equatable.dart';
import 'package:news_app_clean_architecture/core/utils/enum.dart';

import '../../../domain/news_entites/entites_articles.dart';

class ArticlesState extends Equatable {
  final ArticlesModel? articlesModel;
  final bool? isReadOnly;
  final Request? request;
  final List? localData;
  const  ArticlesState(
      {this.articlesModel,
      this.isReadOnly = false,
      this.localData  ,
      this.request = Request.loading});

  ArticlesState copyWith(
      {bool? isReadOnly,
      List? localData ,
      ArticlesModel? articlesModel,
      Request? request = Request.loading}) {
    return ArticlesState(
      localData: localData ?? this.localData,
        isReadOnly: isReadOnly ?? this.isReadOnly,
        request: request ?? this.request,
        articlesModel: articlesModel ?? this.articlesModel);
  }

  @override
  List<Object> get props => [isReadOnly!, request!];
}
