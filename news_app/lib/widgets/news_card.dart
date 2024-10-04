import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/screens/article_details_screen.dart';
import 'package:news_app/widgets/card_asset_image.dart';

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
        margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ) +
            const EdgeInsets.only(
              top: 20,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              imageUrl: articleModel.image,
              placeholder: (context, url) => const CardAssetImage(
                image: AppAssets.placeholderImage,
                height: 250,
              ),
              errorWidget: (context, url, error) => const CardAssetImage(
                image: AppAssets.errorImage,
                height: 250,
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
