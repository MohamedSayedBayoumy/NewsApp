// ignore_for_file: must_be_immutable

part of 'on_boarding_bloc.dart';

@immutable
abstract class OnBoardingEvent {}

class SwitchPageViewEvent extends OnBoardingEvent{
  BuildContext context ;
  int? turn ;


  SwitchPageViewEvent(this.turn ,{required this.context});
}


class NavigatorToLoginScreen extends OnBoardingEvent{
  BuildContext context ;

  NavigatorToLoginScreen({required this.context});
}