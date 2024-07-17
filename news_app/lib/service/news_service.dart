import 'package:dio/dio.dart';
import 'package:news_app/model/article_model.dart';

class NewsService {
  final Dio dio;
  final String baseUrl = 'https://newsapi.org';
  final String apiKey = '0cd37b395ff7489fa58cbc9aaf6f85ca';

  const NewsService(this.dio);

  Future<List<ArticleModel>> getNews() async {
    try {
      final response = await dio.get(
          '$baseUrl/v1/articles?source=the-next-web&apiKey=$apiKey');

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        if (article['author'] != null &&
            article['urlToImage'] != null &&
            article['title'] != null &&
            article['description'] != null &&
            article['url'] != null && 
            article['publishedAt'] != null) {
          articlesList.add(ArticleModel.fromJSON(article));
        }
      }
      return articlesList;
    } catch (e){
      throw Exception();
    }
  }
}