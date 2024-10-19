import 'package:flutter/material.dart';
import 'package:parks/assets/buttons/custom_bottom_nav_bar.dart';
import 'package:parks/screens/community_screen.dart';
import 'package:parks/screens/profile_screen.dart';
import 'package:parks/screens/saved_screen.dart';
import 'explore_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          ExploreScreen(),
          CommunityScreen(),
          SavedScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
