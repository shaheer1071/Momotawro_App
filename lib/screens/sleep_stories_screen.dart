import 'package:flutter/material.dart';
import 'podcast_screen.dart';

class SleepStoriesScreen extends StatelessWidget {
  const SleepStoriesScreen({super.key});

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
        title: const Text(
          'Podcast',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Card - Sleep With Me
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8B7FFF), Color(0xFF7B6FFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image placeholder
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        'assets/images/s12.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.bedtime, size: 40, color: Colors.white);
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'DAILY PICK',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Sleep With Me\nBedtime Stories',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Train your mind for a happier,\nhealthier life',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow, color: Colors.white),
                      label: const Text(
                        'Let\'s Start',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6366F1),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Wellness Section
              const Text(
                'Wellness',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 16),

              // Grid of wellness cards
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
                children: [
                  _buildWellnessCard(
                    'Living Beyond Fear',
                    '15 minutes',
                    'assets/images/s13.png',
                    true,
                  ),
                  _buildWellnessCard(
                    'The Twilight Zone',
                    '15 minutes',
                    'assets/images/s14.png',
                    false,
                  ),
                  _buildWellnessCard(
                    'Retrain Your Brain',
                    '15 minutes',
                    'assets/images/s15.png',
                    true,
                  ),
                  _buildWellnessCard(
                    'A Meditation Lullaby',
                    '15 minutes',
                    'assets/images/s16.png',
                    false,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Premium Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF06B6D4), Color(0xFF0EA5E9)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Text(
                      'GO PREMIUM',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Time to unlock full\nlibrary',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PodcastScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Go Premium',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF06B6D4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWellnessCard(String title, String duration, String imagePath, bool isNew) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE5F5FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFD0E5FF),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Stack(
              children: [
                // Image
                Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.self_improvement, size: 50, color: Color(0xFF6366F1)),
                    );
                  },
                ),

                // New badge
                if (isNew)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'New',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF6366F1),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  duration,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}