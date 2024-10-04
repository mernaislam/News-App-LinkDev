import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/widgets/adaptive_layout.dart';
import 'package:news_app/widgets/custom_app_bar.dart';
import 'package:news_app/widgets/custom_drawer.dart';
import 'package:news_app/widgets/news_future_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final screenSize70 = 0.7;
  final quarterScreenSize = 0.25;

  @override
  Widget build(BuildContext context) {
    var mobileTabletLayout = Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: AppColors.grey,
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * screenSize70,
        child: const CustomDrawer(),
      ),
      body: const NewsFutureBuilder(),
    );

    return AdaptiveLayout(
      tabletLayout: (context) => mobileTabletLayout,
      mobileLayout: (context) => mobileTabletLayout,
      desktopLayout: (context) => Scaffold(
        appBar: const CustomAppBar(),
        backgroundColor: AppColors.grey,
        body: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * quarterScreenSize,
              child: const CustomDrawer(),
            ),
            const Expanded(
              child: NewsFutureBuilder(),
            )
          ],
        ),
      ),
    );
  }
}
