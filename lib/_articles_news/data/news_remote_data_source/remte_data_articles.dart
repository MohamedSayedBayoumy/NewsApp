import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:news_app_clean_architecture/core/network/error.dart';
import 'package:news_app_clean_architecture/core/utils/api_constance.dart';

import '../../../core/global/globals.dart';
import '../news_model_data/articles_model_data.dart';

abstract class BaseRemoteArticlesData {
  Future<List<CurrentModelData>> fetchArticlesData(
      {required int? from, required int? to});
}

class RemoteArticlesData implements BaseRemoteArticlesData {
  @override
  Future<List<CurrentModelData>> fetchArticlesData(
      {required int? from, required int? to}) async {
    try {
      final response =
          await Dio().get(ApiConstanceArticles.baseUrl, queryParameters: {
        "q": "keyword",
        "apiKey": ApiConstanceArticles.apiKey,
      });
      lastData = response.data["articles"];
      box = await Hive.openBox('CacheData');
      box.put('CacheData', lastData.getRange(0, 3).toList());

      return List<CurrentModelData>.from(response.data["articles"]
              .map((e) => CurrentModelData.fromJson(e)))
          .getRange(from!, to!)
          .toList();
    } on DioError {
      return [] ;
    }
  }
}
