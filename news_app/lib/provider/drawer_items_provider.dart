import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/helpers/app_strings.dart';
import 'package:news_app/model/drawer_items_model.dart';

class DrawerItemNotifier extends StateNotifier<List<DrawerItemModel>> {
  DrawerItemNotifier()
      : super(
          [
            DrawerItemModel(
              icon: AppAssets.exploreIcon,
              id: 0,
              name: AppStrings.explore,
              selected: true,
            ),
            DrawerItemModel(
              icon: AppAssets.liveIcon,
              id: 1,
              name: AppStrings.liveChat,
              selected: false,
            ),
            DrawerItemModel(
              icon: AppAssets.galleryIcon,
              id: 0,
              name: AppStrings.gallery,
              selected: false,
            ),
            DrawerItemModel(
              icon: AppAssets.wishlistIcon,
              id: 0,
              name: AppStrings.wishlist,
              selected: false,
            ),
            DrawerItemModel(
              icon: AppAssets.magazineIcon,
              id: 0,
              name: AppStrings.magazine,
              selected: false,
            ),
          ],
        );

  void toggleState(String val) {
    state = state.map((e) {
      if (e.name == val) {
        print(e.name);
        e.selected = true;
      } else {
        e.selected = false;
      }
      return e;
    }).toList();
    // state = [...state];
  }
}

final drawerItems =
    StateNotifierProvider<DrawerItemNotifier, List<DrawerItemModel>>(
  (ref) {
    return DrawerItemNotifier();
  },
);
