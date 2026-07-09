import 'package:delivery_app/chat_screen.dart';
import 'package:delivery_app/favorite_screen.dart';
import 'package:delivery_app/profile_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:delivery_app/widgets/custom_nav_bar.dart';
import '../models/custom_nav_bar_model.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int currentIndex = 0;

  final List<NavItem> navItems = [
    NavItem(icon: Icons.home, label: 'Home', page: HomeScreen()),
    NavItem(icon: Icons.favorite, label: 'Favorite', page: FavoriteScreen()),
    NavItem(icon: Icons.chat, label: 'Message', page: ChatScreen()),
    NavItem(
      icon: Icons.person,
      label: 'Profile',
      page: ProfileScreen(), // Replace with your actual ProfileScreen widget
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navItems[currentIndex].page,

      // ✅ USE YOUR CUSTOM NAV BAR
      bottomNavigationBar: CustomNavBar(
        selectedIndex: currentIndex,
        items: navItems,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
