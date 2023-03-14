abstract class AuthEvent {}

class LoginByFaceBookEvent extends AuthEvent {}

class LoginByGmailEvent extends AuthEvent {
  String? email;

  String? password;

  LoginByGmailEvent({required this.email, required this.password});
}

class LoginByEmailAndPasswordEvent extends AuthEvent {
  String? email;

  String? password;

  LoginByEmailAndPasswordEvent({required this.email, required this.password});
}

class ChangeIconEvent extends AuthEvent {}
