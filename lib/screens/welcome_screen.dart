import 'package:flutter/material.dart';
import 'phone_verification_screen.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Logo
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    'M',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Title
              const Text(
                'Welcome to',
                style:
                TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
              ),
              const Text(
                'Momotaro UI Kit',
                style:
                TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),

              const SizedBox(height: 16),

              // Subtitle
              const Text(
                'The best UI Kit for your next\nhealth and fitness project!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 20),

              // Illustration
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xFFE8EAFF),
                      borderRadius: BorderRadius.circular(24)),
                  child: Center(
                    child: Image.asset(
                      'assets/images/s1.png', // make sure this path exists
                      width: 250,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Centered Get Started Button
              Center(
                child: SizedBox(
                  width: 200, // button width
                  height: 50, // button height
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PhoneVerificationScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6366F1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Already have account text
              const Text(
                'Already have an account? Sign in',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}