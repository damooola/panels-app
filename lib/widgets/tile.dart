import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final int index;
  final double extent;
  final String imageSource;
  const Tile(
      {super.key,
      required this.index,
      required this.extent,
      required this.imageSource});

  @override
  Widget build(BuildContext context) {
    return Image.network(imageSource);
  }
}
