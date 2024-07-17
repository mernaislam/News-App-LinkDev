import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/widgets/news_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    super.key,
    required this.articles,
    required this.crossAxisCount,
  });

  final List<ArticleModel> articles;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      padding: EdgeInsets.zero,
      itemCount: articles.length,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      itemBuilder: (context, index) => NewsCard(
        articleModel: articles[index],
      ),
    );
  }
}
