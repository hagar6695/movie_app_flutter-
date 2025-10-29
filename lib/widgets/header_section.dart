// import 'package:flutter/material.dart';

// class CustomHeader extends StatelessWidget {
//   final String username;
//   final String profileImage;

//   const CustomHeader({
//     super.key,
//     required this.username,
//     required this.profileImage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // 👤 صورة البروفايل + النصوص
//           Row(
//             children: [
//               CircleAvatar(
//                 radius: 22,
//                 backgroundImage: AssetImage(profileImage),
//               ),
//               const SizedBox(width: 12),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Hello $username',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const Text(
//                     'Enjoy your favourite movie',
//                     style: TextStyle(color: Colors.white54, fontSize: 13),
//                   ),
//                 ],
//               ),
//             ],
//           ),

//           // 🔔 أيقونة الإشعارات
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.notifications_none,
//               color: Colors.white,
//               size: 26,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


  import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String username;
  final String profileImage;
  final Color backgroundColor; // 👈 إضافة هذا

  const CustomHeader({
    super.key,
    required this.username,
    required this.profileImage,
    required this.backgroundColor, // 👈 إضافة هذا
  });

  @override
  Widget build(BuildContext context) {
    // ⭐ حدد لون النص والأيقونة بناءً على لون الخلفية
    bool isBackgroundLight = backgroundColor.computeLuminance() > 0.5;
    Color textColor = isBackgroundLight ? Colors.black : Colors.white;
    Color textSecondaryColor = isBackgroundLight
        ? Colors.black54
        : Colors.white54;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(profileImage),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello $username',
                    style: TextStyle(
                      color: textColor, // 👈 غيرنا من const
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Enjoy your favourite movie',
                    style: TextStyle(
                      color: textSecondaryColor, // 👈 غيرنا من const
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: textColor, // 👈 غيرنا من const
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}