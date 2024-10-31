import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/tile.dart';

const double sliderHeight = 300;

class ExploreScreen extends StatefulWidget {
  final Function(bool) onScrollUp;
  const ExploreScreen({super.key, required this.onScrollUp});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final pageController = PageController();
  int currentIndex = 0;
  final _scrollController = ScrollController();
  bool _isVisible = true;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible && _scrollController.position.pixels >= sliderHeight) {
          setState(() {
            _isVisible = false;
          });
          // widget.onScrollUp(_isVisible);
        }
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible) {
          setState(() {
            _isVisible = true;
          });
          //  widget.onScrollUp(_isVisible);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isVisible ? Colors.black : Colors.white,
      body: SafeArea(
        top: !_isVisible,
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              // image slider
              SliverAppBar(
                backgroundColor: Colors.black,
                expandedHeight: sliderHeight,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      PageView.builder(
                        onPageChanged: (pageIndex) {
                          setState(() {
                            currentIndex = pageIndex;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              // image
                              Image.network(
                                "https://picsum.photos/500/500?random=slide_$index",
                                fit: BoxFit.cover,
                              ),
                              // gradient
                              const DecoratedBox(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.black,
                                            Colors.transparent
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          stops: [0.01, 1])))
                            ],
                          );
                        },
                        itemCount: 5,
                      ),
                      Positioned(
                          bottom: 20,
                          left: 0,
                          right: 0,
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: List.generate(
                              5,
                              (index) {
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentIndex == index
                                          ? Colors.yellow
                                          : Colors.red),
                                );
                              },
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              // app button
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: SliverAppBar(
                    backgroundColor: _isVisible
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                    floating: true,
                    snap: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    )),
                    centerTitle: true,
                    title: TextButton.icon(
                      onPressed: () {},
                      label: const Text("Search"),
                      icon: const Icon(CupertinoIcons.search),
                      style: const ButtonStyle(
                          foregroundColor: WidgetStatePropertyAll(Colors.black),
                          iconSize: WidgetStatePropertyAll(25),
                          textStyle:
                              WidgetStatePropertyAll(TextStyle(fontSize: 15))),
                    )),
              )
            ];
          },
          body: Container(
            color: Colors.white,
            child: MasonryGridView.count(
              padding: const EdgeInsets.all(12),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemBuilder: (context, index) {
                return Tile(
                  index: index,
                  imageLink: "https://picsum.photos/500/500?random=img_$index",
                  height: (index % 2) == 0 ? 400 : 250,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
