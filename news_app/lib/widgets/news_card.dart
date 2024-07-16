import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/theme/app_colors.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){},
      child: const Card(
        margin: EdgeInsets.only(
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
                'https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg',
              ),
              height: 260,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // static data for testing
                  Text(
                    'Amazing Images: The Best Science Photos of the Week',
                    style: TextStyle(
                      fontSize: 22,
                      color: AppColors.titleColor,
                    ),
                  ),
                  Text(
                    'By Livescience.com',
                    style: TextStyle(
                      color: AppColors.authorColor,
                      fontSize: 17,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'April 3, 2017',
                      style: TextStyle(
                        color: AppColors.dateColor,
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
