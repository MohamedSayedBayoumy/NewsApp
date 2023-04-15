abstract class ArticlesEvent {}

class FetchArticleDataEvent extends ArticlesEvent {
  int? from;

  FetchArticleDataEvent({this.from});
}

class TranslateArticleDataEvent extends ArticlesEvent {
  final String? title;
  final String? description;
  final int? indexItem;

  TranslateArticleDataEvent({this.title, this.description , this.indexItem});
}
