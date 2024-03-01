
import 'package:web_services_v2/models/source.dart';

class Article {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    author: json["author"]?? "",
    title: json["title"]?? "",
    description: json["description"] ?? "",
    url: json["url"]?? "",
    urlToImage: json["urlToImage"] ?? "",
    publishedAt: DateTime.tryParse(json["publishedAt"].toString()) ?? DateTime.now(),
    content: json["content"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}
