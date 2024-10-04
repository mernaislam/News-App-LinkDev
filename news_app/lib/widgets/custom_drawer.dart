import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/helpers/spacing.dart';
import 'package:news_app/provider/drawer_items_provider.dart';
import 'package:news_app/widgets/drawer_header.dart';
import 'package:news_app/widgets/drawer_item.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 40,
            top: 60,
            right: 30,
          ),
          child: CustomDrawerHeader(),
        ),
        verticalSpace(30),
        for (var item in ref.read(drawerItems))
          DrawerItem(
            icon: item.icon,
            title: item.name,
            selected: ref.watch(currentSelectedDrawerItem) == item.id,
            onTap: () {
              ref.read(currentSelectedDrawerItem.notifier).state = item.id;
            },
          ),
      ],
    );
  }
}
