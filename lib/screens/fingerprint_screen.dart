import 'package:flutter/material.dart';
import 'profile_picture_screen.dart';

class FingerprintScreen extends StatelessWidget {
  const FingerprintScreen({super.key});

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
                color: Color(0xFF6366F1), // purple
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),

      /// Body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center, // vertically center
              children: [

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
                  'Enable Fingerprint',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),

                const SizedBox(height: 16),

                /// DESCRIPTION
                const Text(
                  'If you enable touch ID, you don\'t need to enter your password when you login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6B7280),
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 30),

                /// ✅ Fingerprint Image (s2.png)
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'assets/images/s2.png', // correct path
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 40),

                /// ✅ Activate Button (centered)
                SizedBox(
                  width: 220,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePictureScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6366F1), // purple
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Activate',
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