import 'package:flutter/material.dart';
import 'package:renres_app/Screens/favorites_screen.dart';
import 'package:renres_app/Screens/home_screen.dart';
import 'package:renres_app/Screens/profile_screen.dart';
import 'package:renres_app/Screens/search_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15, vertical: 10),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            onTabChange: (index){
              setState(() {
                _selectedIndex = index;
              });
            },
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(icon: Icons.home, text: 'Home',),
              GButton(icon: Icons.favorite_border, text: 'Likes',),
              GButton(icon: Icons.search, text: 'Search',),
              GButton(icon: Icons.settings, text: 'Settings',),
            ],
          ),
        ),
      ),
    );
  }
}

