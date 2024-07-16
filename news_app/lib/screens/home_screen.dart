import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/widgets/custom_app_bar.dart';
import 'package:news_app/widgets/custom_drawer.dart';
import 'package:news_app/widgets/news_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = 'homeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: AppColors.grey,
      drawer: const CustomDrawer(),
      body: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: 7,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemBuilder: (context, index) => const NewsCard()
      ),
    );
  }
}
