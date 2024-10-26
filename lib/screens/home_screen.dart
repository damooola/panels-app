import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/tile.dart';

class HomeScreen extends StatefulWidget {
  final Function(bool) onScrollUp;
  const HomeScreen({super.key, required this.onScrollUp});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  bool _isVisible = true;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible) {
          _isVisible = false;
          widget.onScrollUp(_isVisible);
        }
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible) {
          _isVisible = true;
          widget.onScrollUp(_isVisible);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 3,
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              floating: true,
              snap: true,
              title: Icon(
                Icons.panorama_horizontal,
                size: 45,
              ),
              centerTitle: true,
              bottom: TabBar(
                tabs: [
                  Tab(text: "Suggested"),
                  Tab(text: "Liked"),
                  Tab(text: "Library")
                ],
                indicatorColor: Colors.red,
                indicatorWeight: 4,
                labelColor: Colors.red,
                overlayColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 232, 191, 188)),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            MasonryGridView.count(
              padding: const EdgeInsets.all(8),
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemBuilder: (context, index) {
                return Tile(
                  index: index,
                  imageLink: "https://picsum.photos/500/500?random=$index",
                  height: (index % 2) == 0 ? 400 : 250,
                );
              },
            ),
            const SizedBox(),
            const SizedBox()
          ],
        ),
      ),
    ));
  }
}
