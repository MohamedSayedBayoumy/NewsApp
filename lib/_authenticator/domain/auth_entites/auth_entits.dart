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
  dynamic phone;
  dynamic name;
  dynamic image;

  AuthParameters(
      {this.email, this.password, this.image, this.name, this.phone});

  @override
  List<Object> get props => [email!, password!, phone, name, image];
}
