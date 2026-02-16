import 'package:flutter/material.dart';
import 'onboarding_screen.dart'; // ✅ OnboardingScreen import

class ProfilePictureScreen extends StatelessWidget {
  const ProfilePictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// App Bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xFF6366F1),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Color(0xFF6366F1),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),

      /// Body
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),

                /// STEP
                const Text(
                  'STEP 7/7',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 8),

                /// TITLE
                const Text(
                  'Profile Picture',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),

                const SizedBox(height: 20),

                /// 3 Images Row with Purple Background
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6366F1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/s3.png'),
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/s4.png'),
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/s5.png'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// Info Text
                const Text(
                  'You can select this photo from one of these emoji or add your own photo as a profile photo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 20),

                /// Add Custom Photo Button
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: const Color(0xFF6366F1), width: 2),
                  ),
                  child: const Text(
                    'Add Custom Photo',
                    style: TextStyle(
                      color: Color(0xFF6366F1),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// Continue Button → Navigate to OnboardingScreen
                SizedBox(
                  width: 220,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OnboardingScreen(), // ✅ Link updated
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6366F1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}