import 'package:flutter/material.dart';
import '../models/movie.dart';

class WishlistProvider extends ChangeNotifier {
  final List<Movie> _wishlist = [];

  List<Movie> get wishlist => _wishlist;

  void addToWishlist(Movie movie) {
    if (!_wishlist.contains(movie)) {
      _wishlist.add(movie);
      notifyListeners();
    }
  }

  void removeFromWishlist(Movie movie) {
    _wishlist.remove(movie);
    notifyListeners();
  }

  void toggleWishlist(Movie movie) {
    if (_wishlist.contains(movie)) {
      _wishlist.remove(movie);
    } else {
      _wishlist.add(movie);
    }
    notifyListeners();
  }
}
