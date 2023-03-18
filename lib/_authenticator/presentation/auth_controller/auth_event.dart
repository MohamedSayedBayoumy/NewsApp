abstract class AuthEvent {}

class LoginByFaceBookEvent extends AuthEvent {}

class LoginByGmailEvent extends AuthEvent {}

class LoginByEmailAndPasswordEvent extends AuthEvent {
  String? email;

  String? password;

  LoginByEmailAndPasswordEvent({required this.email, required this.password});
}

class RegisterByFaceBookEvent extends AuthEvent {}

class RegisterByGmailEvent extends AuthEvent {
  dynamic context;
  RegisterByGmailEvent({required this.context});
}

class RegisterByEmailAndPasswordEvent extends AuthEvent {
  String? email;

  String? password;

  RegisterByEmailAndPasswordEvent(
      {required this.email, required this.password});
}

class AddPhoneNumberEvent extends AuthEvent {
  String? phoneNumber;
  dynamic context ;

  AddPhoneNumberEvent(
      {required this.phoneNumber ,required this.context});
}

class ChangeIconEvent extends AuthEvent {}
