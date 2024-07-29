import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/helpers/app_assets.dart';
import 'package:news_app/core/helpers/app_strings.dart';
import 'package:news_app/model/drawer_items_model.dart';

class CurrentItemNotifier extends StateNotifier<int> {
  CurrentItemNotifier() : super(0);
  void setId(int id) => state = id;
}

final currentSelectedDrawerItem =
    StateNotifierProvider<CurrentItemNotifier, int>(
  (ref) => CurrentItemNotifier(),
);

final List<DrawerItemModel> drawerItems = 
    [
      DrawerItemModel(
        icon: AppAssets.exploreIcon,
        id: 0,
        name: AppStrings.explore,
      ),
      DrawerItemModel(
        icon: AppAssets.liveIcon,
        id: 1,
        name: AppStrings.liveChat,
      ),
      DrawerItemModel(
        icon: AppAssets.galleryIcon,
        id: 2,
        name: AppStrings.gallery,
      ),
      DrawerItemModel(
        icon: AppAssets.wishlistIcon,
        id: 3,
        name: AppStrings.wishlist,
      ),
      DrawerItemModel(
        icon: AppAssets.magazineIcon,
        id: 4,
        name: AppStrings.magazine,
      ),
    ];

// final drawerItems = Provider<List<DrawerItemModel>>(
//   (ref) {
//     return [
//       DrawerItemModel(
//         icon: AppAssets.exploreIcon,
//         id: 0,
//         name: AppStrings.explore,
//       ),
//       DrawerItemModel(
//         icon: AppAssets.liveIcon,
//         id: 1,
//         name: AppStrings.liveChat,
//       ),
//       DrawerItemModel(
//         icon: AppAssets.galleryIcon,
//         id: 2,
//         name: AppStrings.gallery,
//       ),
//       DrawerItemModel(
//         icon: AppAssets.wishlistIcon,
//         id: 3,
//         name: AppStrings.wishlist,
//       ),
//       DrawerItemModel(
//         icon: AppAssets.magazineIcon,
//         id: 4,
//         name: AppStrings.magazine,
//       ),
//     ];
//   },
// );
