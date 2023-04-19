import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:news_app_clean_architecture/core/utils/api_constance.dart';

import '../../../core/global/globals.dart';
import '../news_model_data/articles_model_data.dart';

abstract class BaseRemoteArticlesData {
  Future<List<CurrentModelData>> fetchArticlesData({required int? from});
}

class RemoteArticlesData implements BaseRemoteArticlesData {
  @override
  Future<List<CurrentModelData>> fetchArticlesData({required int? from}) async {
    try {
      final response =
          await Dio().get(ApiConstanceArticles.baseUrl, queryParameters: {
        "q": "keyword",
        "apiKey": ApiConstanceArticles.apiKey,
      });

      box = await Hive.openBox('CacheData');
      await box.put('CacheData',
          response.data["articles"].getRange(0, 3).toList() as List<dynamic>);

      return List<CurrentModelData>.from(response.data["articles"]
              .map((e) => CurrentModelData.fromJson(e)))
          .getRange(from!, from + 15)
          .toList();
    } on DioError {
      return [];
    } on RangeError catch (e) {
      final response =
          await Dio().get(ApiConstanceArticles.baseUrl, queryParameters: {
        "q": "keyword",
        "apiKey": ApiConstanceArticles.apiKey,
      });
      return List<CurrentModelData>.from(response.data["articles"]
              .map((e) => CurrentModelData.fromJson(e)))
          .getRange(from!, e.end!.toInt())
          .toList();
    }
  }
}
