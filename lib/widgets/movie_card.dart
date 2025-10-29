// <<<<<<< HEAD
// import 'package:flutter/material.dart';

// class MovieCard extends StatefulWidget {
//   final String imageUrl;
//   final String title;
//   final String description;

//   const MovieCard({
//     super.key,
//     required this.imageUrl,
//     required this.title,
//     required this.description,
//   });

//   @override
//   State<MovieCard> createState() => _MovieCardState();
// }

// class _MovieCardState extends State<MovieCard> {
//   bool isFavorite = false;
//   bool isInWishlist = false;
//   bool isHovered = false; // 👈 حالة جديدة لتأثير الـ Hover

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => isHovered = true),
//       onExit: (_) => setState(() => isHovered = false),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         curve: Curves.easeInOut,
//         width: 180,
//         decoration: BoxDecoration(
//           color: isHovered ? Colors.grey[850] : Colors.grey[900],
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: isHovered
//               ? [
//                   BoxShadow(
//                     color: const Color.fromARGB(
//                       255,
//                       239,
//                       232,
//                       16,
//                     ).withOpacity(0.5),
//                     blurRadius: 12,
//                     spreadRadius: 1,
//                     offset: const Offset(0, 6),
//                   ),
//                 ]
//               : [],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 🖼️ صورة الفيلم + الأزرار
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.vertical(
//                     top: Radius.circular(16),
//                   ),
//                   child: Image.network(
//                     widget.imageUrl,
//                     height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Positioned(
//                   right: 8,
//                   top: 8,
//                   child: Row(
//                     children: [
//                       // ❤️ Favorite Button
//                       IconButton(
//                         onPressed: () {
//                           setState(() {
//                             isFavorite = !isFavorite;
//                           });
//                         },
//                         icon: Icon(
//                           isFavorite ? Icons.favorite : Icons.favorite_border,
//                           color: isFavorite ? Colors.red : Colors.white,
//                         ),
//                       ),
//                       // 🔖 Wishlist Button
//                       IconButton(
//                         onPressed: () {
//                           setState(() {
//                             isInWishlist = !isInWishlist;
//                           });
//                         },
//                         icon: Icon(
//                           isInWishlist ? Icons.bookmark : Icons.bookmark_border,
//                           color: isInWishlist ? Colors.amber : Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             // 📝 العنوان والوصف
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.title,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     widget.description,
//                     style: const TextStyle(color: Colors.white70, fontSize: 12),
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 2,
//                   ),
//                 ],
//               ),
              
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../screens/details_screen.dart';
// =======
// >>>>>>> f89e3c02ddb3db8feae2ab78157ceb66a4e739c4






// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/favorites_model.dart';

// class MovieCard extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String description;

//   const MovieCard({
//     super.key,
//     required this.imageUrl,
//     required this.title,
//     required this.description,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final favoritesProvider = Provider.of<FavoritesModel>(context);
//     final isFav = favoritesProvider.isFavorite(title);

//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       curve: Curves.easeInOut,
//       width: 180,
//       decoration: BoxDecoration(
//         color: Colors.grey[900],
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: isFav
//             ? [
//                 BoxShadow(
//                   color: Colors.red.withOpacity(0.5),
//                   blurRadius: 10,
//                   spreadRadius: 1,
//                   offset: const Offset(0, 6),
//                 ),
//               ]
//             : [],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//                 child: Image.network(
//                   imageUrl,
//                   height: 200,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 right: 8,
//                 top: 8,
//                 child: IconButton(
//                   onPressed: () {
//                     favoritesProvider.toggleFavorite({
//                       'title': title,
//                       'imageUrl': imageUrl,
//                       'description': description,
//                     });
//                   },
//                   icon: Icon(
//                     isFav ? Icons.favorite : Icons.favorite_border,
//                     color: isFav ? Colors.red : Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   description,
//                   style: const TextStyle(color: Colors.white70, fontSize: 12),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 2,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../models/favorites_model.dart';

// class MovieCard extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String description;

//   const MovieCard({
//     super.key,
//     required this.imageUrl,
//     required this.title,
//     required this.description,
//   });

//   @override
// <<<<<<< HEAD
//   State<MovieCard> createState() => _MovieCardState();
// }

// class _MovieCardState extends State<MovieCard> {
//   bool isFavorite = false;
//   bool isInWishlist = false;

//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: const BoxConstraints(
//         maxWidth: 200, // 👈 يمنع الكارت من التمدد الزايد
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.grey[900],
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius:
//                         const BorderRadius.vertical(top: Radius.circular(16)),
//                     child: Image.network(
//                       widget.imageUrl,
//                       height: 200,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) => Container(
//                         height: 200,
//                         color: Colors.grey[700],
//                         child: const Center(child: Text("No Image")),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     right: 4,
//                     top: 4,
//                     child: Row(
//                       children: [
//                         IconButton(
//                           padding: EdgeInsets.zero,
//                           constraints: const BoxConstraints(),
//                           onPressed: () =>
//                               setState(() => isFavorite = !isFavorite),
//                           icon: Icon(
//                             isFavorite
//                                 ? Icons.favorite
//                                 : Icons.favorite_border,
//                             color: isFavorite ? Colors.red : Colors.white,
//                             size: 22,
//                           ),
//                         ),
//                         const SizedBox(width: 4),
//                         IconButton(
//                           padding: EdgeInsets.zero,
//                           constraints: const BoxConstraints(),
//                           onPressed: () =>
//                               setState(() => isInWishlist = !isInWishlist),
//                           icon: Icon(
//                             isInWishlist
//                                 ? Icons.bookmark
//                                 : Icons.bookmark_border,
//                             color: isInWishlist
//                                 ? Colors.amber
//                                 : Colors.white,
//                             size: 22,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.title,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       widget.description,
//                       style: const TextStyle(
//                         color: Colors.white70,
//                         fontSize: 12,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 2,
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => MovieDetailsScreen(
//                             movieTitle: widget.title,
//                             movieDescription: widget.description,
//                             movieImageUrl: widget.imageUrl,
//                           ),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFFE14D2A), // 👈 لون الزرار 
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 10,
//                       ),
//                     ),
//                     child: const Text(
//                       "View Details",
//                       style: TextStyle(
//                         color: Colors.black, // 👈 النص بالأسود علشان يكون واضح على الأصفر
//                         fontWeight: FontWeight.bold,
//                         fontSize: 13,
//                       ),
//                     ),
// =======
//   Widget build(BuildContext context) {
//     final favoritesProvider = Provider.of<FavoritesModel>(context);
//     final isFav = favoritesProvider.isFavorite(title);

//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       curve: Curves.easeInOut,
//       width: 180,
//       decoration: BoxDecoration(
//         color: Colors.grey[900],
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: isFav
//             ? [
//                 BoxShadow(
//                   color: Colors.red.withOpacity(0.5),
//                   blurRadius: 10,
//                   spreadRadius: 1,
//                   offset: const Offset(0, 6),
//                 ),
//               ]
//             : [],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius:
//                     const BorderRadius.vertical(top: Radius.circular(16)),
//                 child: Image.network(
//                   imageUrl,
//                   height: 200,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 right: 8,
//                 top: 8,
//                 child: IconButton(
//                   onPressed: () {
//                     favoritesProvider.toggleFavorite({
//                       'title': title,
//                       'imageUrl': imageUrl,
//                       'description': description,
//                     });
//                   },
//                   icon: Icon(
//                     isFav ? Icons.favorite : Icons.favorite_border,
//                     color: isFav ? Colors.red : Colors.white,
// >>>>>>> f89e3c02ddb3db8feae2ab78157ceb66a4e739c4
//                   ),
//                 ),
//               ),
//             ],
//           ),
// <<<<<<< HEAD
//         ),
// =======
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   description,
//                   style: const TextStyle(color: Colors.white70, fontSize: 12),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 2,
//                 ),
//               ],
//             ),
//           ),
//         ],
// >>>>>>> f89e3c02ddb3db8feae2ab78157ceb66a4e739c4
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/favorites_model.dart';
import '../screens/details_screen.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const MovieCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesModel>(context);
    final isFav = favoritesProvider.isFavorite(title);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: 180,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
        boxShadow: isFav
            ? [
                BoxShadow(
                  color: Colors.red.withOpacity(0.4),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 6),
                ),
              ]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    color: Colors.grey[700],
                    child: const Center(child: Text("No Image")),
                  ),
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: IconButton(
                  onPressed: () {
                    favoritesProvider.toggleFavorite({
                      'title': title,
                      'imageUrl': imageUrl,
                      'description': description,
                    });
                  },
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: isFav ? Colors.red : Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailsScreen(
                        movieTitle: title,
                        movieDescription: description,
                        movieImageUrl: imageUrl,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC107), // زرار أصفر
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                child: const Text(
                  "View Details",
                  style: TextStyle(
                    color: Colors.black, // النص بالأسود علشان يبقى واضح
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

