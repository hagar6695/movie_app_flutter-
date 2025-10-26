import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/movie_provider.dart';
import 'screens/main_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ✅ MovieProvider لتخزين وإدارة بيانات الأفلام
        ChangeNotifierProvider(create: (_) => MovieProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App', // ✅ اسم التطبيق
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF121212), // لون الخلفية العام
          primaryColor: Colors.red, // اللون الأساسي
        ),
        home: const MainNavigation(), // ✅ الشاشة الرئيسية
      ),
    );
  }
}
