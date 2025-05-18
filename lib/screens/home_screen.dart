import 'package:flutter/material.dart';
import 'package:flutter_advanced_grid_views/screens/advanced_grid_view_screen.dart';
import 'package:flutter_advanced_grid_views/screens/grid_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPageIndex = 0;

  static const List<Widget> pages = [
    GridViewScreen(),
    AdvancedGridViewScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        surfaceTintColor: Colors.deepOrange,
        shadowColor: Colors.deepOrange,
        indicatorColor: Colors.deepOrange.withValues(alpha: 0.5),
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.grid_view_outlined),
            selectedIcon: Icon(Icons.grid_view_sharp),
            label: 'Simple Grid view',
          ),
          NavigationDestination(
            icon: Icon(Icons.grid_view_outlined),
            selectedIcon: Icon(Icons.grid_view_sharp),
            label: 'Advanced Grid view',
          ),
        ],
      ),
    );
  }
}
