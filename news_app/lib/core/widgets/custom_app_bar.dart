import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        title: const Text('LINK DEVELOPMENT'),
        leading: Builder( // to change menu size
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                size: 30, 
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage(AppAssets.searchIcon),
            ),
          )
        ],
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}