import 'package:news_app_clean_architecture/_articles_news/data/news_remote_data_source/remte_data_articles.dart';
import 'package:news_app_clean_architecture/_articles_news/domain/news_base_repository/base_repository_articles.dart';
import 'package:news_app_clean_architecture/_articles_news/domain/news_entites/entites_articles.dart';

class RepositoryDataArticles extends BaseRepositoryArticles {
  final BaseRemoteArticlesData baseRemoteArticlesData;

  RepositoryDataArticles({required this.baseRemoteArticlesData});

  @override
  Future<ArticlesModel> getArticlesData() {
    final result = baseRemoteArticlesData.fetchArticlesData();
    return result;
  }
}
