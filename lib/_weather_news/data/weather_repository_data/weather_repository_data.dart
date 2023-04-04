import 'package:dartz/dartz.dart';
import 'package:news_app_clean_architecture/_weather_news/domain/weather_base_repository/base_repository_weather.dart';
import 'package:news_app_clean_architecture/_weather_news/domain/weather_entites/weather_model.dart';

import '../../../core/network/error.dart';
import '../weather_remote_data_source/weather_remote_data_source.dart';

class WeatherRepository extends WeatherBaseRepository{
  final WeatherBaseRemoteDataSource weatherBaseRemoteDataSource ;

  WeatherRepository(this.weatherBaseRemoteDataSource);

  @override
  Future<Either<Failure,WeatherModel>> getWeatherByCountry(String? country) async {
    final result = await weatherBaseRemoteDataSource.getWeatherByCountry(country) ;
    return result ;
  }

  @override
  Future<Either<Failure,WeatherModel>> getWeatherByLanAndLat( ) async {
    final result = await weatherBaseRemoteDataSource.getWeatherByLanAndLat( ) ;
    return result ;
  }
}
