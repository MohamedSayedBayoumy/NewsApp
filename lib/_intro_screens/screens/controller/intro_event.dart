// ignore_for_file: must_be_immutable

part of 'intro_bloc.dart';

@immutable
abstract class IntroScreensEvent {}

class SwitchPageViewEvent extends IntroScreensEvent {
  BuildContext context;

  int? turn;

  SwitchPageViewEvent(this.turn, {required this.context});
}


class ActiveIconEvent extends IntroScreensEvent {
  int? index ;

  ActiveIconEvent({required this.index});
}
class ChangeLocalizationEvent extends IntroScreensEvent {
  dynamic context ;

  ChangeLocalizationEvent({required this.context});
}

class ChangeThemeModeEvent extends IntroScreensEvent {}


class GetLocationEvent extends IntroScreensEvent {}
