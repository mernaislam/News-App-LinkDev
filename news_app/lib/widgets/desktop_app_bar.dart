import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/theme/app_colors.dart';

class DesktopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DesktopAppBar({super.key});
  static const List<String> items = [
    'Explore',
    'Live Chat',
    'Gallery',
    'Wish List',
    'E-Magazine'
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.white,
      title: const Text('LINK DEVELOPMENT'),
      centerTitle: true,
      leadingWidth: MediaQuery.of(context).size.width * 0.7,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for(var item in items)
            TextButton(
              onPressed: () {},
              child: Text(
                item,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
        ],
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
