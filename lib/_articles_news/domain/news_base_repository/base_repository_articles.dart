
 import '../news_entites/entites_articles.dart';

abstract class BaseRepositoryArticles {
  Future< List<Articles>  > getArticlesData({ required int? from  } );

  Future<List > getLocalArticlesData();
 
}
