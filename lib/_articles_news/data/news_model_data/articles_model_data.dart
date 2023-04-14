import '../../domain/news_entites/entites_articles.dart';
 

class CurrentModelData extends Articles {
  CurrentModelData(
      {required super.author,

      required super.title,
      required super.description,
      required super.url,
      required super.urlToImage,
      required super.publishedAt,
      required super.content});

  factory CurrentModelData.fromJson(Map<String, dynamic> json) =>
      CurrentModelData(
        author: json["author"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        url: json["url"] ?? "",
        urlToImage: json["urlToImage"] ?? "",
        publishedAt: json["publishedAt"] ?? "",
        content: json["content"] ?? "",
      );
}
