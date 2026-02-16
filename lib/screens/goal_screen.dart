import 'package:flutter/material.dart';
import 'gender_screen.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  List<int> selectedGoals = [0, 1]; // Weight loss and Better sleeping habit selected

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
                  'Let us know how we\ncan help you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.2,
                  ),
                ),

                const SizedBox(height: 8),

                // Subtitle
                const Text(
                  'You always can change this later',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF9CA3AF),
                  ),
                ),

                const SizedBox(height: 40),

                // Goal Options - Perfectly centered
                Column(
                  children: [
                    // Weight loss - Selected
                    _buildGoalOption(
                      'Weight loss',
                      '🍉',
                      const Color(0xFFFFB3B3),
                      0,
                    ),

                    const SizedBox(height: 12),

                    // Better sleeping habit - Selected
                    _buildGoalOption(
                      'Better sleeping habit',
                      '🛏️',
                      const Color(0xFF4F46E5),
                      1,
                    ),

                    const SizedBox(height: 20),

                    // Track my nutrition - Not selected
                    _buildSimpleOption(
                      'Track my nutrition',
                      '🥑',
                      2,
                    ),

                    const SizedBox(height: 12),

                    // Improve overall fitness - Not selected
                    _buildSimpleOption(
                      'Improve overall fitness',
                      '💪',
                      3,
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Continue Button - Centered
                SizedBox(
                  width: 300,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GenderScreen()),
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

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGoalOption(String title, String emoji, Color backgroundColor, int index) {
    final isSelected = selectedGoals.contains(index);

    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.check,
              size: 14,
              color: Color(0xFF10B981),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleOption(String title, String emoji, int index) {
    final isSelected = selectedGoals.contains(index);

    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF6B7280),
              ),
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? const Color(0xFF10B981) : const Color(0xFFE5E7EB),
            ),
            child: isSelected
                ? const Icon(
              Icons.check,
              size: 14,
              color: Colors.white,
            )
                : null,
          ),
        ],
      ),
    );
  }
}