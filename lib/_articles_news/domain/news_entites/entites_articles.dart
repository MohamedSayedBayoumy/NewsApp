class ArticlesModel {
  String? status;
  List<Articles>? articles;

  ArticlesModel({required this.status, required this.articles});
}

class Articles {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  // Articles.fromJson(Map<String, dynamic> json) {
  //   author = json['author'];
  //   title = json['title'];
  //   description = json['description'];
  //   url = json['url'];
  //   urlToImage = json['urlToImage'];
  //   publishedAt = json['publishedAt'];
  //   content = json['content'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['author'] = this.author;
  //   data['title'] = this.title;
  //   data['description'] = this.description;
  //   data['url'] = this.url;
  //   data['urlToImage'] = this.urlToImage;
  //   data['publishedAt'] = this.publishedAt;
  //   data['content'] = this.content;
  //   return data;
  // }
}
