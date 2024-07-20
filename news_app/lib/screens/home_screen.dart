import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/widgets/adaptive_layout.dart';
import 'package:news_app/widgets/custom_app_bar.dart';
import 'package:news_app/widgets/custom_drawer.dart';
import 'package:news_app/widgets/news_future_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const mobileTabletLayout = Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.grey,
      drawer: CustomDrawer(),
      body: NewsFutureBuilder(),
    );

    return AdaptiveLayout(
      tabletLayout: (context) => mobileTabletLayout,
      mobileLayout: (context) => mobileTabletLayout,
      desktopLayout: (context) => const Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: AppColors.grey,
        body: NewsFutureBuilder(),
      ),
    );
  }
}
