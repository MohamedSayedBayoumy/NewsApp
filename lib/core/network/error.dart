abstract class Failure {
  String? errorMessage;
  Failure({required this.errorMessage});
}


class FailureModelData extends Failure {
  FailureModelData({required super.errorMessage});
  factory FailureModelData.fromJson(Map<String, dynamic> json) =>
      FailureModelData(
        errorMessage: json["message"],
      );
}