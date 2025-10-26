import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final List<IconData> icons = const [
    Icons.home_outlined,
    Icons.ondemand_video_outlined,
    Icons.bookmark_border,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFE14D2A),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            return GestureDetector(
              onTap: () => onTap(index),
              child: Icon(
                icons[index],
                size: 28,
                color: currentIndex == index
                    ? Colors.white
                    : Colors.white.withOpacity(0.7),
              ),
            );
          }),
        ),
      ),
    );
  }
}
