// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class ContractFailure extends Equatable {
  bool? status;

  String? message;

  ContractFailure({required this.status, required this.message});

  @override
  List<Object?> get props => [status ,message];
}

class FailureStatue extends ContractFailure {
  FailureStatue({required super.status, required super.message});
}