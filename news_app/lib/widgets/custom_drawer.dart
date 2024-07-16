import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/widgets/drawer_header.dart';
import 'package:news_app/widgets/drawer_item.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final Map<String, String> _drawerItems = {
    AppAssets.exploreIcon: 'Explore',
    AppAssets.liveIcon: 'Live Chat',
    AppAssets.galleryIcon: 'Gallery',
    AppAssets.wishlistIcon: 'Wish List',
    AppAssets.magazineIcon: 'E-Magazine'
  };

  final Map<String, int> _drawerItemIds = {
    'Explore': 0,
    'Live Chat': 1, 
    'Gallery': 2,
    'Wish List': 3,
    'E-Magazine': 4
  };

  static List<bool> _selected = [true, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 40, top: 60, right: 30),
            child: CustomDrawerHeader(),
          ),
          verticalSpace(30),
          for (var item in _drawerItems.entries)
            DrawerItem(
              icon: item.key,
              title: item.value,
              selected: _selected[_drawerItemIds[item.value]!],
              onTap: () {
                // TODO: push screen and pop drawer
                for (var i = 0; i < _selected.length; i++) {
                  _selected[i] = false;
                }
                _selected[_drawerItemIds[item.value]!] = true;
                setState(() {}); 
              },
            ),
        ],
      ),
    );
  }
}