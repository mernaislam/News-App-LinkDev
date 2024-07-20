class DrawerItemModel {
  final String name;
  final String icon;
  final int id;
  bool selected;

  DrawerItemModel({
    required this.icon,
    required this.id,
    required this.name,
    required this.selected,
  });
}
