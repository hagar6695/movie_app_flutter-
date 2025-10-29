import 'package:flutter/material.dart';

class MovieController extends ChangeNotifier {
  bool isFavorite = false;
  bool isInWishlist = false;
  bool isHovered = false; // ✅ أضفنا المتغير الناقص هنا

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void toggleWishlist() {
    isInWishlist = !isInWishlist;
    notifyListeners();
  }

  void setHovered(bool value) {
  isHovered = value;
  notifyListeners();
}

}
