import 'package:intl/intl.dart';
import 'package:news_app/core/helpers/api_keys.dart';

const noImage = 'https://media.istockphoto.com/id/1452662817/vector/no-picture-available-placeholder-thumbnail-icon-illustration-design.jpg?s=612x612&w=0&k=20&c=bGI_FngX0iexE3EBANPw9nbXkrJJA4-dcEJhCrP8qMw=';
const noUrl = 'https://http.cat/404';

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
    var temp = DateTime.tryParse(json[ArticleApiKeys.datePublished]);
    String? formattedDate;
    if(temp != null) {
      DateTime dateTime = temp;
      DateFormat formatter = DateFormat('MMMM, dd yyyy');
      formattedDate = formatter.format(dateTime);
    }
    return ArticleModel(
      image: json[ArticleApiKeys.image] ?? noImage,
      author: json[ArticleApiKeys.author] ?? 'Unknown',
      title: json[ArticleApiKeys.title] ?? 'No title',
      description: json[ArticleApiKeys.description] ?? 'No description',
      webUrl: json[ArticleApiKeys.webUrl] ?? noUrl,
      datePublished: formattedDate ?? 'No date available',
    );
  }
}
