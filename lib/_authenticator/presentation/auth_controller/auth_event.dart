import 'package:flutter/cupertino.dart';

abstract class AuthEvent {}

class LoginByFaceBookEvent extends AuthEvent {}

class LoginByGmailEvent extends AuthEvent {
  dynamic context;

  LoginByGmailEvent({required this.context});
}

class LoginByEmailAndPasswordEvent extends AuthEvent {
  String? email;

  String? password;

  dynamic context;

  LoginByEmailAndPasswordEvent(
      {required this.email, required this.password, required this.context});
}

class RegisterByFaceBookEvent extends AuthEvent {}

class RegisterByGmailEvent extends AuthEvent {
  dynamic context;

  RegisterByGmailEvent({required this.context});
}

class RegisterByEmailAndPasswordEvent extends AuthEvent {
  dynamic context;

  RegisterByEmailAndPasswordEvent(this.context);
}

class AddPhoneNumberEvent extends AuthEvent {
  String? phoneNumber;
  dynamic context;

  AddPhoneNumberEvent({required this.phoneNumber, required this.context});
}

class LogOut extends AuthEvent {
  dynamic context;

  LogOut(this.context);
}

class ChangeIconEvent extends AuthEvent {}

class ChangeColorButton extends AuthEvent {
  String? value;

  ChangeColorButton(this.value);
}
