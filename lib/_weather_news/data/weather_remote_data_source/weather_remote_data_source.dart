import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/_weather_news/data/weather_model_data/weather_model_data.dart';
import 'package:news_app_clean_architecture/core/global/globals.dart';
import 'package:news_app_clean_architecture/core/utils/api_constance.dart';

abstract class WeatherBaseRemoteDataSource {
  Future<WeatherModelData> getWeatherByLanAndLat();

  Future<WeatherModelData> getWeatherByCountry(String? country);
}

class WeatherRemoteDataSource implements WeatherBaseRemoteDataSource {
  @override
  Future<WeatherModelData> getWeatherByLanAndLat() async {
    try {
      final respone =
          await Dio().get(ApiConstanceWeather.baseUrl, queryParameters: {
        "lat": sharedPreferences.getDouble("latitude"),
        "lon": sharedPreferences.getDouble("longitude"),
        "lang": sharedPreferences.getString("Localization"),
        "appid": ApiConstanceWeather.key,
      });

      return WeatherModelData.fromJson(respone.data);
    } on DioError catch (e) {
      // ignore: avoid_print
      print("hi Data: $e");

      return WeatherModelData.fromJson({"message": "check your connection"});
    }
  }

  @override
  Future<WeatherModelData> getWeatherByCountry(String? country) async {
    try {
      final respone =
          await Dio().get(ApiConstanceWeather.baseUrl, queryParameters: {
        "q": country,
        "appid": ApiConstanceWeather.key,
      });

      return WeatherModelData.fromJson(respone.data);
    } on DioError catch (e) {
      // ignore: avoid_print
      print("hi Data: $e");

      return WeatherModelData.fromJson({"message": "check your connection"});
    } 
  }
}
