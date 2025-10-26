import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context, listen: false);
    final controller = TextEditingController();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey, size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search Movie...",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: (value) {
                provider.searchMovies(value); // نبحث بمجرد الكتابة
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.clear, color: Colors.grey),
            onPressed: () {
              controller.clear();
              provider.fetchMovies(); // يرجع للأفلام الأصلية
            },
          ),
        ],
      ),
    );
  }
}
