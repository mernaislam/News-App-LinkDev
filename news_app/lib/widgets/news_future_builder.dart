import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/widgets/grid_view_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class NewsFutureBuilder extends StatefulWidget {
  const NewsFutureBuilder({super.key});

  @override
  State<NewsFutureBuilder> createState() => _NewsFutureBuilderState();
}

class _NewsFutureBuilderState extends State<NewsFutureBuilder> {
Future<List<ArticleModel>>? _articles;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _articles = NewsService(Dio()).getNews();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _articles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridViewBuilder( // adaptive based on the screen size
              articles: snapshot.data!,
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'There is an error rendering data,\n try again later',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.sp,
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        },
      );
  }
}