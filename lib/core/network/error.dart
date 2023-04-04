
class FailureExcpetion implements Exception {
  final Failure failure;
  FailureExcpetion({required this.failure});
}

abstract class Failure {
  String? text;
  Failure({required this.text});
}

 class StatusFailure extends Failure {
  StatusFailure({required super.text});
}
