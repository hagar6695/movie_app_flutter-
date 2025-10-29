// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'providers/movie_provider.dart';
// import 'screens/main_navigation.dart';


// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         // ✅ MovieProvider لتخزين وإدارة بيانات الأفلام
//         ChangeNotifierProvider(create: (_) => MovieProvider()),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Movie App', // ✅ اسم التطبيق
//         theme: ThemeData.dark().copyWith(
//           scaffoldBackgroundColor: const Color(0xFF121212), // لون الخلفية العام
//           primaryColor: Colors.red, // اللون الأساسي
//         ),
//         home: const MainNavigation(), // ✅ الشاشة الرئيسية
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/movie_provider.dart';
import 'providers/theme_provider.dart';  // ضيفي import للثيم
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
        ChangeNotifierProvider(create: (_) => MovieProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),  // ضيفي الـ provider هنا
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Movie App',
            theme: ThemeData.light(), // الثيم الفاتح
            darkTheme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: const Color(0xFF121212),
              primaryColor: Colors.red,
            ), // الثيم الغامق
            themeMode: themeProvider.currentTheme, // يتحكم في الوضع الحالي
            home: const MainNavigation(),
          );
        },
      ),
    );
  }
}
