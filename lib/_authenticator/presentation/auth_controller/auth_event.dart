abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  String? email;

  String? password;

  LoginEvent({required this.email, required this.password});
}

class ChangeIconEvent extends AuthEvent {}
