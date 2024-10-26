import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final int index;
  final double height;
  final String imageLink;
  const Tile(
      {super.key,
      required this.index,
      required this.height,
      required this.imageLink});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [
          //bottom right
          BoxShadow(
              color: Colors.grey.shade800,
              offset: const Offset(4, 4),
              // spreadRadius: 3,
              blurRadius: 3),
          // top left
          const BoxShadow(
              color: Colors.white, offset: Offset(-4, -4), blurRadius: 3)
        ]),
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.topRight,
            children: [
              Image.network(
                colorBlendMode: BlendMode.darken,
                filterQuality: FilterQuality.high,
                imageLink,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.fromLTRB(8, 1, 8, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Art: $index",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ))
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
