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



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'providers/movie_provider.dart';
// <<<<<<< HEAD
// import 'providers/theme_provider.dart';  // ضيفي import للثيم
// =======
// import 'providers/wishlist_provider.dart';
// import 'models/favorites_model.dart';
// >>>>>>> f89e3c02ddb3db8feae2ab78157ceb66a4e739c4
// import 'screens/main_navigation.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => MovieProvider()),
//         ChangeNotifierProvider(create: (_) => WishlistProvider()),
//         ChangeNotifierProvider(create: (_) => FavoritesModel()), // ✅ أضفناه هنا
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
// <<<<<<< HEAD
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => MovieProvider()),
//         ChangeNotifierProvider(create: (_) => ThemeProvider()),  // ضيفي الـ provider هنا
//       ],
//       child: Consumer<ThemeProvider>(
//         builder: (context, themeProvider, child) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Movie App',
//             theme: ThemeData.light(), // الثيم الفاتح
//             darkTheme: ThemeData.dark().copyWith(
//               scaffoldBackgroundColor: const Color(0xFF121212),
//               primaryColor: Colors.red,
//             ), // الثيم الغامق
//             themeMode: themeProvider.currentTheme, // يتحكم في الوضع الحالي
//             home: const MainNavigation(),
//           );
//         },
// =======
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Movie App',
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: const Color(0xFF121212),
//         primaryColor: Colors.red,
// >>>>>>> f89e3c02ddb3db8feae2ab78157ceb66a4e739c4
//       ),
//       home: const MainNavigation(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/movie_provider.dart';
import 'providers/theme_provider.dart';
import 'models/favorites_model.dart';
import 'providers/wishlist_provider.dart';
import 'screens/main_navigation.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(), // Provider أساسي للتحكم بالثيم
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
      home: 
        // لو Providers تانية محتاجاهم في MainNavigation أو صفحات فرعية:
        ChangeNotifierProvider(
          create: (_) => MovieProvider(),
          child: ChangeNotifierProvider(
            create: (_) => WishlistProvider(),
            child: ChangeNotifierProvider(
              create: (_) => FavoritesModel(),
              child: const MainNavigation(),
            ),
          ),
        ),
    );
  }
}
