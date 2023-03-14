// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class ServerError implements Exception {
  final FailureModel failureModel;

  ServerError({required this.failureModel});
}

class FailureModel extends Equatable {
  bool? status;

  String? message;

  FailureModel({required this.status, required this.message});

  factory FailureModel.fromJson(Map<String, dynamic> json) =>
      FailureModel(status: json["status"], message: json["message"]);

  @override
  List<Object> get props => [status!, message!];
}
