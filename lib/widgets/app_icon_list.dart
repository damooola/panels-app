import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIconList extends StatelessWidget {
  AppIconList({super.key});

  final List<String> iconList = [
    "assets/image-frame-svgrepo-com (1).svg",
    "assets/image-frame-svgrepo-com.svg",
    "assets/image-media-photo-picture-svgrepo-com.svg",
    "assets/image-mobile-ui-svgrepo-com.svg",
    "assets/image-photo-svgrepo-com.svg",
    "assets/image-svgrepo-com (1).svg",
    "assets/image-svgrepo-com (2).svg",
    "assets/image-svgrepo-com.svg",
    "assets/image-svgrepo-com9.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemBuilder: (context, index) =>
            AppIconContainer(svgAsset: iconList[index]),
        itemCount: 9,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class AppIconContainer extends StatelessWidget {
  final String svgAsset;
  const AppIconContainer({super.key, required this.svgAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80,
        height: 20,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              width: Random().nextInt(5).toDouble(),
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
        child: SvgPicture.asset(
          svgAsset,
          width: 80,
          height: 20,
          fit: BoxFit.fill,
        ));
  }
}
