import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/helpers/app_strings.dart';
import 'package:news_app/core/theme/app_colors.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 28,
        child: Image(
          image: AssetImage(
            AppAssets.profileImage,
          ),
        ),
      ),
      title: Text(
        AppStrings.welcome,
        style: TextStyle(
          color: AppColors.black54,
          fontSize: 14,
        ),
      ),
      subtitle: Text(
        'Tony Roshdy',
        style: TextStyle(
          color: AppColors.black,
          fontSize: 18,
        ),
      ),
      trailing: ImageIcon(
        AssetImage(
          AppAssets.arrowIcon,
        ),
        size: 30,
      ),
    );
  }
}
