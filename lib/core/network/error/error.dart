// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String? status;

  String? message;

  Failure({required this.status, required this.message});

  @override
  List<Object?> get props => [status ,message];
}

class FailureStatue extends Failure {
  FailureStatue({required super.status, required super.message});
}