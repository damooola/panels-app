import 'package:flutter/material.dart';
import 'package:panels_app/screens/explore_screen.dart';
import 'package:panels_app/screens/home_screen.dart';
import 'package:panels_app/screens/profile_screen.dart';

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
      const ExploreScreen(),
      const ProfileScreen()
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
      body: IndexedStack(
        index: _screenIndex,
        children: _screens,
      ),
      bottomNavigationBar: AnimatedContainer(
        height: _isVisible ? 70 : 0,
        duration: const Duration(milliseconds: 500),
        child: Wrap(
          children: [
            BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              fixedColor: Colors.black,
              iconSize: 35,
              currentIndex: _screenIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.panorama_horizontal_outlined),
                    label: "Explore"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_box_outlined), label: "Account")
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
