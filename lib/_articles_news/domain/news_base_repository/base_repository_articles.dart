import 'package:dartz/dartz.dart';

import '../../../core/network/error.dart';
import '../news_entites/entites_articles.dart';

abstract class BaseRepositoryArticles {
  Future<Either<Failure ,ArticlesModel >> getArticlesData();

  Future<List > getLocalArticlesData();
 
}
