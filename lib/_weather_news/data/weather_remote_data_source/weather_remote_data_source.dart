import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
 

import '../../../core/global/globals.dart';
import '../../../core/network/error.dart';
import '../../../core/utils/api_constance.dart';
import '../../domain/weather_entites/weather_model.dart';
import '../weather_model_data/weather_model_data.dart';

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
      return Left(FailureModelData.fromJson({"message": "Invalid Data"}));
    }
  }
}
