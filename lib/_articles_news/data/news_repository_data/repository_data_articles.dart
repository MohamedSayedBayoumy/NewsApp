import 'package:dartz/dartz.dart';
import 'package:news_app_clean_architecture/_articles_news/data/news_model_data/articles_model_data.dart';
import 'package:news_app_clean_architecture/_articles_news/data/news_remote_data_source/remte_data_articles.dart';
import 'package:news_app_clean_architecture/_articles_news/domain/news_base_repository/base_repository_articles.dart';
import 'package:news_app_clean_architecture/_articles_news/domain/news_entites/entites_articles.dart';

import '../../../core/network/error.dart';


class RepositoryDataArticles extends BaseRepositoryArticles {
  final BaseRemoteArticlesData baseRemoteArticlesData;

  RepositoryDataArticles({required this.baseRemoteArticlesData});

  @override
  Future<Either<Failure, ArticlesModel>> getArticlesData() async {
    final result = await baseRemoteArticlesData.fetchArticlesData();

    return result;
  }
}
