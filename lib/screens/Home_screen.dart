// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/movie_provider.dart';
// import '../widgets/movie_card.dart';
// import '../widgets/header_section.dart';
// //import '../widgets/navigation_bar.dart';
// import '../widgets/search_bar.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();

//     final movieProvider = Provider.of<MovieProvider>(context, listen: false);
//     movieProvider.fetchMovies();

//     // 🔁 لما المستخدم يوصل نهاية الصفحة، نحمل الصفحة اللي بعدها
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels >=
//           _scrollController.position.maxScrollExtent - 200) {
//         if (!movieProvider.isLoading) {
//           movieProvider.fetchMovies(loadMore: true);
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final movieProvider = Provider.of<MovieProvider>(context);

//     return Scaffold(
//       backgroundColor: const Color(0xFF121212),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           controller: _scrollController, // ✅ استخدمنا الكنترولر هنا
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // 🧑 Header Section
//               const CustomHeader(
//                 username: "Manoj",
//                 profileImage: "assets/images/user.jpg",
//               ),
//               const SizedBox(height: 10),

//               // 🔍 Search Bar
//               const SearchBarWidget(),
//               const SizedBox(height: 15),

//               // 🎬 Section Title
//               const Text(
//                 "Popular Movies",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//               const SizedBox(height: 15),

//               // 📽️ Movie List
//               Builder(
//                 builder: (context) {
//                   if (movieProvider.isLoading && movieProvider.movies.isEmpty) {
//                     return const Center(
//                       child: Padding(
//                         padding: EdgeInsets.all(30),
//                         child: CircularProgressIndicator(color: Colors.red),
//                       ),
//                     );
//                   } else if (movieProvider.errorMessage != null) {
//                     return Center(
//                       child: Text(
//                         movieProvider.errorMessage!,
//                         style: const TextStyle(color: Colors.red),
//                       ),
//                     );
//                   } else {
//                     final movies = movieProvider.movies;

//                     // 🧩 تحديد عدد الأعمدة حسب حجم الشاشة
//                     double screenWidth = MediaQuery.of(context).size.width;
//                     int crossAxisCount = 2;

//                     if (screenWidth > 1200) {
//                       crossAxisCount = 4; // Web / Large screen
//                     } else if (screenWidth > 800) {
//                       crossAxisCount = 3; // Tablet
//                     } else {
//                       crossAxisCount = 2; // Mobile
//                     }

//                     return Column(
//                       children: [
//                         GridView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: movies.length,
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: crossAxisCount,
//                                 crossAxisSpacing: 15,
//                                 mainAxisSpacing: 15,
//                                 childAspectRatio: 0.7,
//                               ),
//                           itemBuilder: (context, index) {
//                             final movie = movies[index];
//                             return MovieCard(
//                               imageUrl: movie.fullPosterPath,
//                               title: movie.title,
//                               description: movie.overview,
//                             );
//                           },
//                         ),

//                         // ⏳ Indicator أثناء تحميل الصفحة التالية
//                         if (movieProvider.isLoading)
//                           const Padding(
//                             padding: EdgeInsets.symmetric(vertical: 20),
//                             child: Center(
//                               child: CircularProgressIndicator(
//                                 color: Colors.red,
//                               ),
//                             ),
//                           ),
//                       ],
//                     );
//                   }
//                 },
//               ),

//               const SizedBox(height: 80),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/movie_provider.dart';
// import '../providers/theme_provider.dart'; // استيراد ThemeProvider
// import '../widgets/movie_card.dart';
// import '../widgets/header_section.dart';
// //import '../widgets/navigation_bar.dart';
// import '../widgets/search_bar.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();

//     final movieProvider = Provider.of<MovieProvider>(context, listen: false);
//     movieProvider.fetchMovies();

//     // 🔁 لما المستخدم يوصل نهاية الصفحة، نحمل الصفحة اللي بعدها
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels >=
//           _scrollController.position.maxScrollExtent - 200) {
//         if (!movieProvider.isLoading) {
//           movieProvider.fetchMovies(loadMore: true);
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final movieProvider = Provider.of<MovieProvider>(context);
//     final themeProvider = Provider.of<ThemeProvider>(context); // نجيب الـ provider للثيم

//     return Scaffold(
//       backgroundColor: const Color(0xFF121212),
//       appBar: AppBar(
//         title: const Text('Home'),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(
//               themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               themeProvider.toggleTheme();
//             },
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           controller: _scrollController, // ✅ استخدمنا الكنترولر هنا
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // 🧑 Header Section
//               const CustomHeader(
//                 username: "Manoj",
//                 profileImage: "assets/images/user.jpg",
//               ),
//               const SizedBox(height: 10),

//               // 🔍 Search Bar
//               const SearchBarWidget(),
//               const SizedBox(height: 15),

//               // 🎬 Section Title
//               const Text(
//                 "Popular Movies",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                 ),
//               ),
//               const SizedBox(height: 15),

//               // 📽️ Movie List
//               Builder(
//                 builder: (context) {
//                   if (movieProvider.isLoading && movieProvider.movies.isEmpty) {
//                     return const Center(
//                       child: Padding(
//                         padding: EdgeInsets.all(30),
//                         child: CircularProgressIndicator(color: Colors.red),
//                       ),
//                     );
//                   } else if (movieProvider.errorMessage != null) {
//                     return Center(
//                       child: Text(
//                         movieProvider.errorMessage!,
//                         style: const TextStyle(color: Colors.red),
//                       ),
//                     );
//                   } else {
//                     final movies = movieProvider.movies;

//                     // 🧩 تحديد عدد الأعمدة حسب حجم الشاشة
//                     double screenWidth = MediaQuery.of(context).size.width;
//                     int crossAxisCount = 2;

//                     if (screenWidth > 1200) {
//                       crossAxisCount = 4; // Web / Large screen
//                     } else if (screenWidth > 800) {
//                       crossAxisCount = 3; // Tablet
//                     } else {
//                       crossAxisCount = 2; // Mobile
//                     }

//                     return Column(
//                       children: [
//                         GridView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: movies.length,
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: crossAxisCount,
//                                 crossAxisSpacing: 15,
//                                 mainAxisSpacing: 15,
//                                 childAspectRatio: 0.7,
//                               ),
//                           itemBuilder: (context, index) {
//                             final movie = movies[index];
//                             return MovieCard(
//                               imageUrl: movie.fullPosterPath,
//                               title: movie.title,
//                               description: movie.overview,
//                             );
//                           },
//                         ),

//                         // ⏳ Indicator أثناء تحميل الصفحة التالية
//                         if (movieProvider.isLoading)
//                           const Padding(
//                             padding: EdgeInsets.symmetric(vertical: 20),
//                             child: Center(
//                               child: CircularProgressIndicator(
//                                 color: Colors.red,
//                               ),
//                             ),
//                           ),
//                       ],
//                     );
//                   }
//                 },
//               ),

//               const SizedBox(height: 80),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/movie_card.dart';
import '../widgets/header_section.dart';
import '../widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    movieProvider.fetchMovies();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        if (!movieProvider.isLoading) {
          movieProvider.fetchMovies(loadMore: true);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    // ✅ ضبط ألوان النصوص بناءً على الثيم
    final backgroundColor =
        themeProvider.isDarkMode ? const Color(0xFF121212) : Colors.white;
    final textColor =
        themeProvider.isDarkMode ? Colors.white : Colors.black87;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: textColor,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               CustomHeader(
                username: "Manoj",
                profileImage: "assets/images/user.jpg",
                backgroundColor: backgroundColor,
              ),
              const SizedBox(height: 10),
              const SearchBarWidget(),
              const SizedBox(height: 15),
              Text(
                "Popular Movies",
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 15),
              Builder(
                builder: (context) {
                  if (movieProvider.isLoading &&
                      movieProvider.movies.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: CircularProgressIndicator(color: Colors.red),
                      ),
                    );
                  } else if (movieProvider.errorMessage != null) {
                    return Center(
                      child: Text(
                        movieProvider.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    final movies = movieProvider.movies;
                    double screenWidth = MediaQuery.of(context).size.width;
                    int crossAxisCount = 2;

                    if (screenWidth > 1200) {
                      crossAxisCount = 4;
                    } else if (screenWidth > 800) {
                      crossAxisCount = 3;
                    } else {
                      crossAxisCount = 2;
                    }

                    return Column(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: movies.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 0.7,
                          ),
                          itemBuilder: (context, index) {
                            final movie = movies[index];
                            return MovieCard(
                              imageUrl: movie.fullPosterPath,
                              title: movie.title,
                              description: movie.overview,
                            );
                          },
                        ),
                        if (movieProvider.isLoading)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.red,
                              ),
                            ),
                          ),
                      ],
                    );
                  }
                },
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
