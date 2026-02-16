import 'package:flutter/material.dart';
import 'mediation_screen.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String selectedGender = 'Male';

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
            onPressed: () {},
            child: const Text('Skip', style: TextStyle(color: Color(0xFF8B5CF6), fontSize: 16)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

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

                const SizedBox(height: 20),

                // Title
                const Text(
                  'Which one are you?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 50),

                // Gender Options - Centered
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Male Option
                    _buildGenderOption(
                      'Male',
                      'assets/images/s6.png', // You can add your image here
                      selectedGender == 'Male',
                      const Color(0xFF6366F1),
                    ),

                    const SizedBox(width: 30),

                    // Female Option
                    _buildGenderOption(
                      'Female',
                      'assets/images/s7.png', // You can add your image here
                      selectedGender == 'Female',
                      const Color(0xFFE5E7EB),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Description
                const Text(
                  'To give you a customize experience\nwe need to know your gender',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF9CA3AF),
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 80),

                // Continue Button - Centered
                SizedBox(
                  width: 300,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MediationScreen()),
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
                      'Continue',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Prefer not to choose
                const Text(
                  'Prefer not to choose',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF8B5CF6),
                    fontWeight: FontWeight.w500,
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

  Widget _buildGenderOption(String gender, String imagePath, bool isSelected, Color backgroundColor) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        width: 140,
        height: 200,
        decoration: BoxDecoration(
          color: isSelected ? backgroundColor : const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? null : Border.all(color: const Color(0xFFE5E7EB), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image placeholder - You can replace with actual images
            Container(
              width: 100,
              height: 120,
              decoration: BoxDecoration(
                color: isSelected ? Colors.white.withValues(alpha: 0.2) : const Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Image.asset(
                  imagePath,
                  width: 80,
                  height: 100,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback if image not found
                    return Icon(
                      gender == 'Male' ? Icons.male : Icons.female,
                      size: 60,
                      color: isSelected ? Colors.white : const Color(0xFF6B7280),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Gender label
            Text(
              gender,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : const Color(0xFF6B7280),
              ),
            ),
          ],
        ),
      ),
    );
  }
}