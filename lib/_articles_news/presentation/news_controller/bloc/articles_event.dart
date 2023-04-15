abstract class ArticlesEvent {}

class FetchArticleDataEvent extends ArticlesEvent {
  int? from;
 

  FetchArticleDataEvent({  this.from });
}
