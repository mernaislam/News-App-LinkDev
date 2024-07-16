import 'package:intl/intl.dart';

class ArticleModel {
  final String image;
  final String author;
  final String title;
  final String description;
  final String webUrl;
  final String datePublished;

  const ArticleModel({
    required this.image,
    required this.author,
    required this.title,
    required this.description,
    required this.webUrl,
    required this.datePublished,
  });

  factory ArticleModel.fromJSON(json) {
    DateTime dateTime = DateTime.parse(json['publishedAt']);
    DateFormat formatter = DateFormat('MMMM, dd yyyy');
    String formattedDate = formatter.format(dateTime);
    return ArticleModel(
      image: json['urlToImage'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      webUrl: json['url'],
      datePublished: formattedDate,
    );
  }
}
