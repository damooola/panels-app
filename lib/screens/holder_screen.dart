import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panels_app/screens/explore_screen.dart';
import 'package:panels_app/screens/home_screen.dart';
import 'package:panels_app/screens/account_screen.dart';

class HolderScreen extends StatefulWidget {
  const HolderScreen({super.key});

  @override
  State<HolderScreen> createState() => _HolderScreenState();
}

class _HolderScreenState extends State<HolderScreen> {
  List<Widget> _screens = [];
  int _screenIndex = 0;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();

    _screens = [
      HomeScreen(
        onScrollUp: onScrollUp,
      ),
      ExploreScreen(
        onScrollUp: onScrollUp,
      ),
      AccountScreen(
        onScrollUp: onScrollUp,
      )
    ];
  }

  onScrollUp(bool visible) {
    setState(() {
      _isVisible = visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: IndexedStack(
        index: _screenIndex,
        children: _screens,
      ),
      bottomNavigationBar: AnimatedContainer(
        // animate the height when scrolling
        height: _isVisible ? 70 : 0,
        duration: const Duration(milliseconds: 500),
        child: Wrap(
          children: [
            BottomNavigationBar(
              elevation: 0,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
              iconSize: 35,
              currentIndex: _screenIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: "For You"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.pano), label: "Explore"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.person_crop_circle),
                    label: "Account")
              ],
              onTap: (index) {
                setState(() {
                  _screenIndex = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
