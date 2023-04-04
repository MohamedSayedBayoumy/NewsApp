import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/_articles_news/data/news_model_data/articles_model_data.dart';
import 'package:news_app_clean_architecture/core/utils/api_constance.dart';

abstract class BaseRemoteArticlesData {
  Future<ArticlesModelData> fetchArticlesData();
}

class RemoteArticlesData implements BaseRemoteArticlesData {
  @override
  Future<ArticlesModelData> fetchArticlesData() async {
    try {
      final response =
          await Dio().get(ApiConstanceArticles.baseUrl, queryParameters: {
        "q": "keyword",
        "apiKey": ApiConstanceArticles.apiKey,
      });
      return ArticlesModelData.fromJson(response.data);
    } on DioError catch (e) {
      return ArticlesModelData.fromJson({"status": "error", "articles": []});
    }
  }
}
