import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/_weather_news/data/weather_model_data/weather_model_data.dart';
import 'package:news_app_clean_architecture/core/global/globals.dart';
import 'package:news_app_clean_architecture/core/utils/api_constance.dart';

import '../../domain/weather_entites/weather_model.dart';

abstract class WeatherBaseRemoteDataSource {
  Future<WeatherModelData> getWeatherByLanAndLat();

  Future<WeatherModelData> getWeatherByCountry(
      );
}

class WeatherRemoteDataSource implements WeatherBaseRemoteDataSource {
  @override
  Future<WeatherModelData> getWeatherByLanAndLat() async {
    try {
      final respone = await Dio().get(ApiConstanceWeather.baseUrl, queryParameters: {
        "lat":   sharedPreferences.getDouble("latitude"),
        "lon": sharedPreferences.getDouble("longitude"),
        "lang": sharedPreferences.getString("Localization") ,
        "appid" : ApiConstanceWeather.key ,
      });
      print("hi Data: ${respone.data}") ;
      return WeatherModelData.fromJson(respone.data);

    } on DioError catch (e) {
      print("hi Data: ${e}") ;

      return WeatherModelData.fromJson({"message": "check your connection"});
    }
  }

  @override
  Future<WeatherModelData> getWeatherByCountry(
      ) {
    // TODO: implement getWeatherByLanAndLat
    throw UnimplementedError();
  }
}
