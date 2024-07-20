import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/model/article_model.dart';

class NewsService {
  final Dio dio = Dio();
  final String baseUrl = 'https://newsapi.org';
  final String apiKey = '1c0f731cca954a13875e6965f9c7e9de';

  NewsService();

  Future<List<ArticleModel>> getNews() async {
    try {
      final response = await dio.get(
          '$baseUrl/v1/articles?source=the-next-web&apiKey=$apiKey');

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        articlesList.add(ArticleModel.fromJSON(article));
      }
      return articlesList;
    } catch (e){
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}