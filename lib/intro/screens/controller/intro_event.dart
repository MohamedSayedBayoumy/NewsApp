// ignore_for_file: must_be_immutable

part of 'intro_bloc.dart';

@immutable
abstract class IntroScreensEvent {}

class SwitchPageViewEvent extends IntroScreensEvent {
  BuildContext context;

  int? turn;

  SwitchPageViewEvent(this.turn, {required this.context});
}

class NavigatorToLoginScreen extends IntroScreensEvent {
  BuildContext context;

  NavigatorToLoginScreen({required this.context});
}

class ActiveIconEvent extends IntroScreensEvent {
  int? index ;

  ActiveIconEvent({required this.index});
}
