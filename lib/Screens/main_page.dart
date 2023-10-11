import 'package:flutter/material.dart';
import 'package:renres_app/Screens/favorites_screen.dart';
import 'package:renres_app/Screens/home_screen.dart';
import 'package:renres_app/Screens/profile_screen.dart';
import 'package:renres_app/Screens/search_screen.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home1.png', width: 30, height: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/search.png', width: 30, height: 30),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/love.png', width: 30, height: 30),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/user.png', width: 30, height: 30),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}