
// import 'package:flutter/material.dart';

// class FavoritesModel extends ChangeNotifier {
//   final List<Map<String, dynamic>> _favorites = [];

//   List<Map<String, dynamic>> get favorites => _favorites;

//   bool isFavorite(String title) {
//     return _favorites.any((movie) => movie['title'] == title);
//   }

//   void addFavorite(Map<String, dynamic> movie) {
//     if (!isFavorite(movie['title'])) {
//       _favorites.add(movie);
//       notifyListeners();
//     }
//   }

//   void removeFavorite(String title) {
//     _favorites.removeWhere((movie) => movie['title'] == title);
//     notifyListeners();
//   }

//   void toggleFavorite(Map<String, dynamic> movie) {
//     if (isFavorite(movie['title'])) {
//       removeFavorite(movie['title']);
//     } else {
//       addFavorite(movie);
//     }
//   }
// }









import 'package:flutter/material.dart';

class FavoritesModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get favorites => _favorites;

  bool isFavorite(String title) {
    return _favorites.any((movie) => movie['title'] == title);
  }

  void addFavorite(Map<String, dynamic> movie) {
    if (!isFavorite(movie['title'])) {
      _favorites.add(movie);
      notifyListeners();
    }
  }

  void removeFavorite(String title) {
    _favorites.removeWhere((movie) => movie['title'] == title);
    notifyListeners();
  }

  void toggleFavorite(Map<String, dynamic> movie) {
    if (isFavorite(movie['title'])) {
      removeFavorite(movie['title']);
    } else {
      addFavorite(movie);
    }
  }
}
