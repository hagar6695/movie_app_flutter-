
import 'package:flutter/material.dart';
import 'Home_screen.dart'; // ✅ استيراد صفحة الهوم
import 'main_navigation.dart';
import 'favorites_screen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ✅ الصورة الثابتة في الأعلى
          Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profile_header.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ✅ صورة البروفايل
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/flower.jpg'),
          ),
          const SizedBox(height: 10),

          const Text(
            'User Name',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 40),

          // ✅ زر "My Favorites"
                            ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FavoritesScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    child: const Text(
                      'My Favorites',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),


                const SizedBox(height: 20),

          // ✅ زر "Logout" → يروح للهوم
          ElevatedButton(
  onPressed: () {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MainNavigation()), // ✅ نرجع للناف
      (route) => false,
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.redAccent,
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
  ),
  child: const Text(
    'Logout',
    style: TextStyle(fontSize: 18, color: Colors.white),
  ),
)

        ],
      ),
    );
  }
}
