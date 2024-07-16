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
    return ArticleModel(
      image: json['urlToImage'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      webUrl: json['url'],
      datePublished: json['publishedAt'],
    );
  }
}
