import 'package:dio/dio.dart';
import '../models/movie.dart';

class MovieService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final String apiKey = '348b4e86b19eeee443ca22cebebf10a8';

  // ✅ جلب قائمة الأفلام الشهيرة (pagination)
  Future<List<Movie>> fetchMovies({int page = 1}) async {
    try {
      final response = await _dio.get(
        '/movie/popular',
        queryParameters: {'api_key': apiKey, 'language': 'en-US', 'page': page},
      );

      if (response.statusCode == 200) {
        final List results = response.data['results'];
        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('فشل في تحميل الأفلام');
      }
    } on DioException catch (e) {
      throw Exception('Dio Error: ${e.message}');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // 🔍 ✅ دالة البحث عن الأفلام
  Future<List<Movie>> searchMovies(String query) async {
    try {
      final response = await _dio.get(
        '/search/movie',
        queryParameters: {
          'api_key': apiKey,
          'language': 'en-US',
          'query': query,
          'page': 1,
          'include_adult': false,
        },
      );

      if (response.statusCode == 200) {
        final List results = response.data['results'];
        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('فشل في البحث عن الأفلام');
      }
    } on DioException catch (e) {
      throw Exception('Dio Error: ${e.message}');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
