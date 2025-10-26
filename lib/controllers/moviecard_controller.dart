import 'package:flutter/material.dart';

class MovieController extends ChangeNotifier {
  bool isFavorite = false;
  bool isInWishlist = false;

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void toggleWishlist() {
    isInWishlist = !isInWishlist;
    notifyListeners();
  }
}
