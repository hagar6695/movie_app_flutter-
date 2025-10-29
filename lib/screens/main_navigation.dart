import 'package:flutter/material.dart';
import '../widgets/navigation_bar.dart';
import 'Home_screen.dart';
import 'wishlist_screen.dart';
import 'profile_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  // ✅ أربع صفحات مقابل أربع أيقونات
  final List<Widget> _pages = const [
    HomePage(),          // index 0 → Home icon
    Placeholder(),       // index 1 → Video icon (مؤقت لحد ما نضيف الصفحة دي)
    WishlistScreen(),    // index 2 → Bookmark icon
    ProfileScreen(),     // index 3 → Profile icon
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
