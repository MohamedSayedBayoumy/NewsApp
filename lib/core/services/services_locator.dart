import 'package:get_it/get_it.dart';
import 'package:news_app_clean_architecture/_articles_news/presentation/news_controller/bloc/articles_bloc.dart';
import 'package:news_app_clean_architecture/_authenticator/data/auth_remote_data_source/auth_remote_data.dart';
import 'package:news_app_clean_architecture/_authenticator/domain/auth_base_repository/auth_base_repository.dart';
import 'package:news_app_clean_architecture/_authenticator/domain/auth_base_use_case/auth_use_case.dart';
import 'package:news_app_clean_architecture/_authenticator/presentation/auth_controller/auth_bloc.dart';
import 'package:news_app_clean_architecture/_weather_news/presentation/weather_controller/bloc/weather_bloc.dart';

import '../../_articles_news/data/news_remote_data_source/remte_data_articles.dart';
import '../../_articles_news/data/news_repository_data/repository_data_articles.dart';
import '../../_articles_news/domain/news_base_repository/base_repository_articles.dart';
import '../../_articles_news/domain/news_base_use_case/use_case_aritcles.dart';
import '../../_authenticator/data/auth_repository_data/auth_data_repository.dart';
import '../../_weather_news/data/weather_remote_data_source/weather_remote_data_source.dart';
import '../../_weather_news/data/weather_repository_data/weather_repository_data.dart';
import '../../_weather_news/domain/weather_base_repository/base_repository_weather.dart';
import '../../_weather_news/domain/weather_base_use_case/weather_base_usecase.dart';
import '../../presentation_screens/presentation/controller/intro_cubit.dart';

final sl = GetIt.asNewInstance();

class ServicesLocator {
  ServicesLocator();

  static void service() {
    sl.registerFactory<IntroBloc>(() => IntroBloc());
    sl.registerFactory<WeatherBloc>(() => WeatherBloc(sl()));
    sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
    sl.registerFactory<ArticlesBloc>(() => ArticlesBloc(sl()));


    sl.registerLazySingleton<BaseRemoteData>(() => RemoteData());
    sl.registerLazySingleton<AuthBaseRepository>(() => AuthRepository(sl()));
    sl.registerLazySingleton(() => AuthUseCase(sl()));

    sl.registerLazySingleton<WeatherBaseRemoteDataSource>(
        () => WeatherRemoteDataSource());
    sl.registerLazySingleton<WeatherBaseRepository>(
        () => WeatherRepository(sl()));
    sl.registerLazySingleton(() => BaseWeatherUseCase(sl()));

    sl.registerLazySingleton<BaseRemoteArticlesData>(
        () => RemoteArticlesData());

    sl.registerLazySingleton<BaseRepositoryArticles>(
        () => RepositoryDataArticles(baseRemoteArticlesData: sl()));

    sl.registerLazySingleton<UseCaseArticles>(
        () => UseCaseArticles(baseRepositoryArticles: sl()));
  }
}
