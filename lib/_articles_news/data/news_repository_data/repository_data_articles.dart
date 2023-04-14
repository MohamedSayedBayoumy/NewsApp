import 'package:news_app_clean_architecture/_articles_news/data/local_data_base_articles/local_data_base.dart';
import 'package:news_app_clean_architecture/_articles_news/data/news_remote_data_source/remte_data_articles.dart';
import 'package:news_app_clean_architecture/_articles_news/domain/news_base_repository/base_repository_articles.dart';

import '../news_model_data/articles_model_data.dart';

class RepositoryDataArticles extends BaseRepositoryArticles {
  final BaseRemoteArticlesData baseRemoteArticlesData;

  final BaseLocalArticlesData baseLocalArticlesData;

  RepositoryDataArticles(
      {required this.baseRemoteArticlesData,
      required this.baseLocalArticlesData});

  @override
  Future<List<CurrentModelData>> getArticlesData(
      {required int? from, required int? to}) async {
    final result =
        await baseRemoteArticlesData.fetchArticlesData(from: from, to: to);

    return result;
  }

  @override
  Future<List> getLocalArticlesData() {
    final result = baseLocalArticlesData.fetchLocalArticlesData();
    return result;
  }
}
