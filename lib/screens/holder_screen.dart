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
  List<Widget> screens = [];
  int screenIndex = 0;

  @override
  void initState() {
    super.initState();

    screens = [
      const HomeScreen(),
      const ExploreScreen(),
      const ProfileScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: screenIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        iconSize: 35,
        currentIndex: screenIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.panorama_horizontal_outlined), label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined), label: "Account")
        ],
        onTap: (index) {
          setState(() {
            screenIndex = index;
          });
        },
      ),
    );
  }
}
