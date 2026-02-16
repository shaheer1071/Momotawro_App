import 'package:flutter/material.dart';
import 'home_screen.dart';

class MediationScreen extends StatelessWidget {
  const MediationScreen({super.key});

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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
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
                const Text(
                  'What\'s your current\nfitness level?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                /// card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5E5FF),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// emoji
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          '💪💪',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// image (Flexible so it shrinks on small screens)
                      Flexible(
                        child: Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            'assets/images/s8.png',
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) => const Icon(
                              Icons.fitness_center,
                              size: 80,
                              color: Color(0xFF6366F1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        'Moderate Intensity',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'I always work out regular two\nor three times a week.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// button
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HomeScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6366F1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          child: const Text(
                            'Select',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20), // extra space at bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}