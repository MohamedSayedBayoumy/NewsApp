
import 'package:get_it/get_it.dart';
import 'package:news_app_clean_architecture/on_boarding/screens/controller/on_boarding_bloc.dart';

final sl = GetIt.asNewInstance() ;

class ServicesLocator{

  ServicesLocator();

  static void service(){
    sl.registerFactory<OnBoardingBloc>(() =>OnBoardingBloc());
  }

}