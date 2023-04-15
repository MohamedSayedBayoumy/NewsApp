import 'package:news_app_clean_architecture/_articles_news/domain/news_base_repository/base_repository_articles.dart';

 import '../news_entites/entites_articles.dart';

class UseCaseArticles {
  final BaseRepositoryArticles baseRepositoryArticles;
  UseCaseArticles({required this.baseRepositoryArticles});

  Future<  List<Articles>>  getArticlesData({  int? from  }) async {
    return await baseRepositoryArticles.getArticlesData(from: from ?? 0);
  }

  Future<List> getLocalArticlesData() {
    return baseRepositoryArticles.getLocalArticlesData();
  }
}
