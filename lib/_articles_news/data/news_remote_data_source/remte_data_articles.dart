import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:news_app_clean_architecture/_articles_news/data/news_model_data/articles_model_data.dart';
import 'package:news_app_clean_architecture/core/network/error.dart';
import 'package:news_app_clean_architecture/core/utils/api_constance.dart';

import '../../../core/global/globals.dart';

abstract class BaseRemoteArticlesData {
  Future<Either<Failure, ArticlesModelData>> fetchArticlesData();
}

class RemoteArticlesData implements BaseRemoteArticlesData {
  @override
  Future<Either<Failure, ArticlesModelData>> fetchArticlesData() async {
    try {
      final response =
          await Dio().get(ApiConstanceArticles.baseUrl, queryParameters: {
        "q": "keyword",
        "apiKey": ApiConstanceArticles.apiKey,
      });
      lastData = response.data["articles"];
      box = await Hive.openBox('CacheData');
      box.put('CacheData', lastData.getRange(0, 3).toList());

      return Right(ArticlesModelData.fromJson(response.data));
    } on DioError {
      return Left(FailureModelData.fromJson({"message": "Invalid"}));
    }
  }
}
