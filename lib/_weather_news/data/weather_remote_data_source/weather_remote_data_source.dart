import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/_weather_news/data/weather_model_data/weather_model_data.dart';
import 'package:news_app_clean_architecture/core/global/globals.dart';
import 'package:news_app_clean_architecture/core/utils/api_constance.dart';

import '../../../core/network/error.dart';
import '../../domain/weather_entites/weather_model.dart';

abstract class WeatherBaseRemoteDataSource {
  Future<Either<Failure, WeatherModel>> getWeatherByLanAndLat();

  Future<Either<Failure, WeatherModel>> getWeatherByCountry(String? country);
}

class WeatherRemoteDataSource implements WeatherBaseRemoteDataSource {
  @override
  Future<Either<Failure, WeatherModel>> getWeatherByLanAndLat() async {
    try {
      final respone =
          await Dio().get(ApiConstanceWeather.baseUrl, queryParameters: {
        "lat": sharedPreferences.getDouble("latitude"),
        "lon": sharedPreferences.getDouble("longitude"),
        "lang": sharedPreferences.getString("Localization"),
        "appid": ApiConstanceWeather.key,
      });

      print("hi : ${sharedPreferences.getDouble("longitude")}");

      return Right(WeatherModelData.fromJson(respone.data));
    } on DioError {
      return Left(FailureModelData.fromJson({"message": "Invalid"}));
    }
  }

  @override
  Future<Either<Failure, WeatherModel>> getWeatherByCountry(
      String? country) async {
    try {
      final respone =
          await Dio().get(ApiConstanceWeather.baseUrl, queryParameters: {
        "q": country,
        "appid": ApiConstanceWeather.key,
      });

      return Right(WeatherModelData.fromJson(respone.data));
    } on DioError {
      return Left(FailureModelData.fromJson({"message": "Invalid"}));
    }
  }
}
