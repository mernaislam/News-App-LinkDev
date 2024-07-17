import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/adaptive_layout.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/widgets/grid_view.dart';

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({super.key, required this.articles});

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      tabletLayout: (context) => GridViewWidget(articles: articles, crossAxisCount: 2,),
      desktopLayout: (context) => GridViewWidget(articles: articles, crossAxisCount: 3,),
      mobileLayout: (context) => GridViewWidget(articles: articles, crossAxisCount: 1,),
    );
  }
}
