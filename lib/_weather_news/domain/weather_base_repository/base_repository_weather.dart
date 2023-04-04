import 'package:dartz/dartz.dart';
import 'package:news_app_clean_architecture/_weather_news/domain/weather_entites/weather_model.dart';
import 'package:news_app_clean_architecture/core/network/error.dart';

abstract class WeatherBaseRepository {

  Future<Either<Failure,WeatherModel>> getWeatherByLanAndLat();

  Future<Either<Failure,WeatherModel>> getWeatherByCountry(String? country);
}
