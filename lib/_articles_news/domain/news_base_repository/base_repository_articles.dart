import 'package:dartz/dartz.dart';

 import '../news_entites/entites_articles.dart';

abstract class BaseRepositoryArticles {
  Future< List<Articles>  > getArticlesData({ required int? from , required int? to } );

  Future<List > getLocalArticlesData();
 
}
