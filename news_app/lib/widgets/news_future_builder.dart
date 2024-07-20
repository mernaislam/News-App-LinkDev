import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/widgets/grid_view_builder.dart';
import 'package:news_app/widgets/news_failed.dart';

class NewsFutureBuilder extends StatefulWidget {
  const NewsFutureBuilder({super.key});

  @override
  State<NewsFutureBuilder> createState() => _NewsFutureBuilderState();
}

class _NewsFutureBuilderState extends State<NewsFutureBuilder> {
  late Future<List<ArticleModel>> _articles;

  Future<void> _onRefresh() async {
    setState(() {
      _articles = NewsService(Dio()).getNews();
    });
    await _articles;
  }

  @override
  void initState() {
    super.initState();

    _articles = NewsService(Dio()).getNews();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: FutureBuilder(
        future: _articles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridViewBuilder(
              // adaptive based on the screen size
              articles: snapshot.data ?? [],
            );
          }
          if (snapshot.hasError) {
            return NewsFailed(onRefresh: _onRefresh);
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
