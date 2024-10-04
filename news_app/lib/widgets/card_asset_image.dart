import 'package:flutter/material.dart';

class CardAssetImage extends StatelessWidget {
  const CardAssetImage({super.key, required this.image, required this.height});
  final String image;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      height: height,
      width: double.infinity,
      fit: BoxFit.cover,
      image,
    );
  }
}
