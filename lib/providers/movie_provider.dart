import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';

class MovieProvider with ChangeNotifier {
  final MovieService _movieService = MovieService();

  List<Movie> _movies = [];
  int _currentPage = 1;
  bool isLoading = false;
  String? errorMessage;
  String _searchQuery = '';

  List<Movie> get movies => _movies;

  // ✅ جلب الأفلام (مع pagination)
  Future<void> fetchMovies({bool loadMore = false}) async {
    try {
      isLoading = true;
      notifyListeners();

      if (!loadMore) {
        _movies.clear();
        _currentPage = 1;
      } else {
        _currentPage++;
      }

      // لو المستخدم بيبحث، نستخدم البحث بدل العادي
      List<Movie> newMovies = [];
      if (_searchQuery.isNotEmpty) {
        newMovies = await _movieService.searchMovies(_searchQuery);
      } else {
        newMovies = await _movieService.fetchMovies(page: _currentPage);
      }

      _movies.addAll(newMovies);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //  دالة البحث عن الأفلام
  Future<void> searchMovies(String query) async {
    try {
      isLoading = true;
      notifyListeners();

      _searchQuery = query; // نخزّن الكلمة عشان لو المستخدم كمل load
      _movies = await _movieService.searchMovies(query);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //  دالة لمسح البحث والرجوع لقائمة الأفلام الأصلية
  Future<void> clearSearch() async {
    _searchQuery = '';
    await fetchMovies();
  }
}
