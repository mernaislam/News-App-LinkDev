import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/widgets/custom_app_bar.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/widgets/custom_drawer.dart';
import 'package:news_app/widgets/news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: AppColors.grey,
      drawer: const CustomDrawer(),
      body: FutureBuilder(
        future: _articles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              itemBuilder: (context, index) => NewsCard(
                articleModel: snapshot.data![index],
              ),
            );
          }
          if(snapshot.hasError) {
            return const Center(
              child: Text(
                'There is an error rendering data,\n try again later',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
            );
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
