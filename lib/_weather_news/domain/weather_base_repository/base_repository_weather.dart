import 'package:dartz/dartz.dart';

import '../../../core/network/error.dart';
import '../weather_entites/weather_model.dart';
 

abstract class WeatherBaseRepository {

  Future<Either<Failure,WeatherModel>> getWeatherByLanAndLat();

  Future<Either<Failure,WeatherModel>> getWeatherByCountry(String? country);
}
