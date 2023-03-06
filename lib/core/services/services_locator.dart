import 'package:get_it/get_it.dart';
import 'package:news_app_clean_architecture/_authenticator/data/auth_remote_data_source/auth_remote_data.dart';
import 'package:news_app_clean_architecture/_authenticator/domain/auth_base_repository/auth_base_repository.dart';
import 'package:news_app_clean_architecture/_authenticator/domain/auth_base_use_case/auth_use_case.dart';
import 'package:news_app_clean_architecture/_authenticator/presentation/auth_controller/auth_bloc.dart';
import 'package:news_app_clean_architecture/on_boarding/screens/controller/on_boarding_bloc.dart';

import '../../_authenticator/data/auth_repository_data/auth_data_repository.dart';

final sl = GetIt.asNewInstance();

class ServicesLocator {
  ServicesLocator();

  static void service() {
    sl.registerFactory<OnBoardingBloc>(() => OnBoardingBloc());
    sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));

    sl.registerLazySingleton<BaseRemoteData>(() => RemoteData());
    sl.registerLazySingleton<AuthBaseRepository>(() => AuthRepository(sl()));
    sl.registerLazySingleton(() => AuthUseCase(sl()));
  }
}
