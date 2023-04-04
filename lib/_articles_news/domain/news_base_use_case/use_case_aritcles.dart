import 'package:dartz/dartz.dart';
import 'package:news_app_clean_architecture/_articles_news/domain/news_base_repository/base_repository_articles.dart';

import '../../../core/network/error.dart';
import '../news_entites/entites_articles.dart';

class UseCaseArticles {
  final BaseRepositoryArticles baseRepositoryArticles;
  UseCaseArticles({required this.baseRepositoryArticles});

  Future<Either<Failure,ArticlesModel>> getArticlesData() async {
    return await baseRepositoryArticles.getArticlesData();
  }
}
