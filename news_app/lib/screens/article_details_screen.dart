import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/widgets/custom_app_bar.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/screens/web_view_article_screen.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: AppColors.grey,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Card(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Image(
                        image: NetworkImage(
                          articleModel.image,
                        ),
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        color: const Color.fromARGB(129, 0, 0, 0),
                        child: Text(
                          articleModel.datePublished,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          articleModel.title,
                          style: const TextStyle(
                            fontSize: 23,
                            color: AppColors.titleColor,
                          ),
                        ),
                        Text(
                          articleModel.author,
                          style: const TextStyle(
                            fontSize: 18,
                            color: AppColors.black54,
                          ),
                        ),
                        verticalSpace(20),
                        Text(
                          articleModel.description,
                          style: const TextStyle(
                            fontSize: 18,
                            color: AppColors.black54,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          WebViewArticleScreen(articleUrl: articleModel.webUrl),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.white,
                  backgroundColor: AppColors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                child: const Text(
                  'OPEN WEBSITE',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
