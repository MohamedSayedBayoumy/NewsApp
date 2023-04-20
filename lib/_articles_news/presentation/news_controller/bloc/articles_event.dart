abstract class ArticlesEvent {}

class FetchArticleDataEvent extends ArticlesEvent {
  int? from;
  bool? refrash = false;

  FetchArticleDataEvent({this.from, this.refrash});
}

class TranslateArticleDataEvent extends ArticlesEvent {
  final String? title;
  final String? description;
  final int? indexItem;
  final dynamic context;

  TranslateArticleDataEvent(
      {this.title, this.description, this.indexItem, required this.context});
}
 
