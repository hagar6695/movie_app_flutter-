// import 'package:flutter/material.dart';

// class MovieDetailsScreen extends StatelessWidget {
//   final String movieTitle;
//   final String movieDescription;
//   final String movieImageUrl;

//   const MovieDetailsScreen({
//     super.key,
//     required this.movieTitle,
//     required this.movieDescription,
//     required this.movieImageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF121212),
//       appBar: AppBar(
//         backgroundColor: Colors.black.withOpacity(0.8),
//         title: Text(movieTitle),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(16),
//               child: Image.network(
//                 movieImageUrl,
//                 width: double.infinity,
//                 height: 300,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) => Container(
//                   height: 300,
//                   color: Colors.grey[700],
//                   child: const Center(child: Text("No Image")),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               movieTitle,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 12),
//             Text(
//               movieDescription,
//               style: const TextStyle(
//                 color: Colors.grey,
//                 fontSize: 16,
//                 height: 1.5,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String movieTitle;
  final String movieDescription;
  final String movieImageUrl;

  const MovieDetailsScreen({
    super.key,
    required this.movieTitle,
    required this.movieDescription,
    required this.movieImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    final bgColor = isDark ? Color(0xFF121212) : Colors.white;
    final titleColor = isDark ? Colors.white : Colors.black87;
    final descColor = isDark ? Colors.white70 : Colors.black54;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: titleColor),
        title: Text(
          movieTitle,
          style: TextStyle(color: titleColor),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: titleColor,
            ),
            onPressed: () => themeProvider.toggleTheme(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                movieImageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 300,
                  color: Colors.grey[400],
                  child: const Center(child: Text("No Image")),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              movieTitle,
              style: TextStyle(
                color: titleColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              movieDescription,
              style: TextStyle(
                color: descColor,
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
