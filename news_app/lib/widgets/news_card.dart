import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/screens/article_details_screen.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.articleModel,
  });
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticleDetailsScreen(
              articleModel: articleModel,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            FadeInImage(
              placeholder: AssetImage(
                AppAssets.placeholderImage,
              ),
              image: NetworkImage(
                articleModel.image,
                // 'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
              ),
              height: 260,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articleModel.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 22,
                      color: AppColors.titleColor,
                    ),
                  ),
                  Text(
                    articleModel.author,
                    style: const TextStyle(
                      color: AppColors.black54,
                      fontSize: 17,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      articleModel.datePublished,
                      style: const TextStyle(
                        color: AppColors.black54,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
