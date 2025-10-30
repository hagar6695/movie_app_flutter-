import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/movie_provider.dart';
import 'providers/theme_provider.dart';
import 'models/favorites_model.dart';
import 'providers/wishlist_provider.dart';
import 'screens/main_navigation.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => MovieProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: Colors.red,
      ),
      themeMode: themeProvider.currentTheme,
      home: const MainNavigation(),
    );
  }
}
