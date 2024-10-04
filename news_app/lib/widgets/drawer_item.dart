import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/helpers/spacing.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.selected,
  });
  final String icon;
  final String title;
  final bool selected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsetsDirectional.only(start: 2, top: 30),
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (selected)
              Image.asset(
                AppAssets.selectedIcon,
                height: 50,
              ),
            horizontalSpace(10),
            ImageIcon(
              AssetImage(
                icon,
              ),
              size: 30,
            ),
          ],
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
