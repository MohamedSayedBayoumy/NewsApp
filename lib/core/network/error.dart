import 'package:news_app_clean_architecture/_articles_news/domain/news_entites/entites_articles.dart';

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
