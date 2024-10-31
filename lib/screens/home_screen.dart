import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  title: Stack(
                    fit: StackFit.passthrough,
                    alignment: Alignment.bottomRight,
                    children: [
                      SvgPicture.asset(
                        "assets/image-picture-svgrepo-com10.svg",
                        width: 50,
                        height: 50,
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.note_alt_outlined),
                      )
                    ],
                  ),
                  centerTitle: true,
                  bottom: TabBar(
                    tabs: const [
                      Tab(text: "Suggested"),
                      Tab(text: "Liked"),
                      Tab(text: "Library")
                    ],
                    indicatorColor: Theme.of(context).colorScheme.tertiary,
                    indicatorWeight: 4,
                    labelColor: Theme.of(context).colorScheme.inversePrimary,
                    overlayColor: const WidgetStatePropertyAll(
                        Color.fromARGB(255, 104, 103, 102)),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                MasonryGridView.count(
                  padding: const EdgeInsets.all(12),
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
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
