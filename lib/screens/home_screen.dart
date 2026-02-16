import 'package:flutter/material.dart';
import 'ready_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          height: 4,
          width: 100,
          decoration: BoxDecoration(
            color: const Color(0xFF6366F1),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReadyScreen()),
              );
            },
            child: const Text('Skip', style: TextStyle(color: Color(0xFF8B5CF6), fontSize: 16)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Step indicator
                const Text(
                  'STEP 1/7',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8B5CF6),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 16),

                // Title
                const Text(
                  'Do you want to turn\non notification?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 30),

                // Notification illustration with purple gradient background
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFF8B7FFF), Color(0xFF7B6FFF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/notification_illustration.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        // Fallback illustration
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 120,
                              height: 75,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E293B),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Container(
                              width: 110,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Row(
                                children: [
                                  SizedBox(width: 10),
                                  Icon(Icons.notifications, color: Color(0xFF6366F1), size: 20),
                                  SizedBox(width: 6),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        height: 5,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(color: Color(0xFFE5E7EB)),
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      SizedBox(
                                        width: 55,
                                        height: 5,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(color: Color(0xFFE5E7EB)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Positioned(
                              top: 20,
                              right: 25,
                              child: Icon(Icons.star, color: Color(0xFF06B6D4), size: 18),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Features list - Centered
                Center(
                  child: Column(
                    children: [
                      _buildFeatureItem('✨', 'New weekly healthy reminder'),
                      const SizedBox(height: 12),
                      _buildFeatureItem('🔥', 'Motivational reminder'),
                      const SizedBox(height: 12),
                      _buildFeatureItem('💜', 'Personalised program'),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Allow Button - Centered
                Center(
                  child: SizedBox(
                    width: 300,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ReadyScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6366F1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Allow',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
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

  Widget _buildFeatureItem(String emoji, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          emoji,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}