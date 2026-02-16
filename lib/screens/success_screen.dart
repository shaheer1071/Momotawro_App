import 'package:flutter/material.dart';
import 'sleep_stories_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF8B7FFF), Color(0xFF7B6FFF)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                // Success Illustration with decorative elements
                SizedBox(
                  height: 300,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Decorative stars
                      const Positioned(
                        top: 20,
                        left: 40,
                        child: Icon(Icons.star, color: Colors.white70, size: 20),
                      ),
                      const Positioned(
                        top: 80,
                        left: 20,
                        child: Icon(Icons.star, color: Colors.white, size: 16),
                      ),
                      const Positioned(
                        top: 60,
                        right: 30,
                        child: Icon(Icons.star, color: Color(0xFF06B6D4), size: 18),
                      ),
                      const Positioned(
                        bottom: 100,
                        left: 50,
                        child: Icon(Icons.star, color: Color(0xFF10B981), size: 16),
                      ),
                      const Positioned(
                        bottom: 80,
                        right: 40,
                        child: Icon(Icons.star, color: Colors.white60, size: 14),
                      ),

                      // Main illustration - Female character
                      Center(
                        child: Image.asset(
                          'assets/images/s10.png',
                          width: 250,
                          height: 250,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            // Fallback illustration
                            return Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.celebration,
                                size: 100,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Title
                const Text(
                  'You are ready to go!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                // Description
                const Text(
                  'Thanks for taking your time to\ncreate account with us. Now this is\nthe fun part, let\'s explore the app.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),

                const Spacer(),

                // Get Started Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SleepStoriesScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Get Started!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6366F1),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}