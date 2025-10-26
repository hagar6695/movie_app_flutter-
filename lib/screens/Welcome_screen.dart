import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🖼️ الخلفية تغطي الشاشة بالكامل
          Positioned.fill(
            child: Image.asset(
              'assets/images/2.jpg',
              fit: BoxFit.cover,
              // تغطي الشاشة بدون تمدد
            ),
          ),

          // 🌟 المحتوى فوق الصورة
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),

                  // 🔹 شعار واسم التطبيق
                  const Column(
                    children: [
                      Text(
                        "Movie+",
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Discover your favorite movies",
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ],
                  ),

                  const Spacer(flex: 3),

                  // 🔸 الأزرار
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 280,
                          child: CustomButton(
                            text: 'Sign In',
                            color: Colors.deepOrange,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: 280,
                          child: CustomButton(
                            text: 'Sign Up',
                            color: Colors.deepOrange,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 280,
                          child: CustomButton(
                            text: 'Continue with Google',
                            color: Colors.black,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
