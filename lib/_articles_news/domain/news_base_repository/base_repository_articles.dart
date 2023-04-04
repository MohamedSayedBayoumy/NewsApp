import '../news_entites/entites_articles.dart';

abstract class BaseRepositoryArticles {
  Future<ArticlesModel> getArticlesData();

 
}
