abstract class ArticlesEvent {}

class FetchArticleDataEvent extends ArticlesEvent {
  int? from;
  int? to;

  FetchArticleDataEvent({required this.from, required this.to});
}
