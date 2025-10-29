             

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/favorites_model.dart';
import '../widgets/movie_card.dart';
import '../widgets/navigation_bar.dart';
import 'main_navigation.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesModel>(context);
    final favorites = favoritesProvider.favorites;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE14D2A),
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet',
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final movie = favorites[index];
                return MovieCard(
                  imageUrl: movie['imageUrl'],
                  title: movie['title'],
                  description: movie['description'],
                );
              },
            ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: 1,
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainNavigation()),
          );
        },
      ),
    );
  }
}
