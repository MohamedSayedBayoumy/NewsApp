// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  bool? status;

  String? message;

  Map<String, dynamic>? data;

  AuthModel({required this.status, required this.message, required this.data});

  @override
  List<Object?> get props => [status, message, data!];
}

class AuthParameters extends Equatable {
  String? email;

  String? password;

  AuthParameters(this.email, this.password);

  @override
  List<Object> get props => [email!, password!];
}
