import 'package:flutter/material.dart';
import 'goal_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

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
          width: 90,
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
                color: Color(0xFF8B5CF6),
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),

              const Text(
                'STEP 1/7',
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFF8B5CF6),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.1,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Time to customize\nyour interest',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 18),

              /// 🔹 SMALL CARDS GRID
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.0, // ⬅️ square small cards
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    final interests = [
                      {'title': 'Nutrition', 'emoji': '🍉', 'color': Color(0xFFFFE5E5)},
                      {'title': 'Organic', 'emoji': '🌾', 'color': Color(0xFFE5F5E5)},
                      {'title': 'Meditation', 'emoji': '🍃', 'color': Color(0xFFE5F5E5)},
                      {'title': 'Sports', 'emoji': '🏃‍♂️', 'color': Color(0xFFFFB3B3)},
                      {'title': 'Smoke Free', 'emoji': '🚭', 'color': Color(0xFFF5F5F5)},
                      {'title': 'Sleep', 'emoji': '🛏️', 'color': Color(0xFFF5F5F5)},
                      {'title': 'Health', 'emoji': '💪', 'color': Color(0xFFFFE5CC)},
                      {'title': 'Running', 'emoji': '👟', 'color': Color(0xFFE5E5FF)},
                      {'title': 'Vegan', 'emoji': '🥑', 'color': Color(0xFFE5F9F9)},
                    ];

                    final interest = interests[index];
                    final isSelected = index == 3;

                    return Container(
                      decoration: BoxDecoration(
                        color: interest['color'] as Color,
                        borderRadius: BorderRadius.circular(14),
                        border: isSelected
                            ? Border.all(
                          color: const Color(0xFF6366F1),
                          width: 2,
                        )
                            : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            interest['emoji'] as String,
                            style: const TextStyle(fontSize: 22), // 🔽 smaller emoji
                          ),
                          const SizedBox(height: 6),
                          Text(
                            interest['title'] as String,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12, // 🔽 smaller text
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? const Color(0xFF6366F1)
                                  : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              /// 🔹 CONTINUE BUTTON (CENTERED)
              Center(
                child: SizedBox(
                  width: 200, // fixed width for button
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GoalScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6366F1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
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
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}