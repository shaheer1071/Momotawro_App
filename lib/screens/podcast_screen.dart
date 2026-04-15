import 'package:flutter/material.dart';
import 'podcast_player_screen.dart';

class PodcastScreen extends StatelessWidget {
  const PodcastScreen({super.key});

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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'WELLNESS',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8B5CF6),
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
                  color: Colors.black,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5F5FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF06B6D4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/images/s18.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.person, color: Colors.white, size: 24),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'by Joseph Fink',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6366F1),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text('Follow',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8B7FFF), Color(0xFF7B6FFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  'assets/images/s17.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.headphones, size: 60, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Train your mind for a happier, healthier life by learning the fundamentals of meditation and mindfulness',
                style: TextStyle(fontSize: 14, color: Color(0xFF6B7280), height: 1.5),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Offline download',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black)),
                      Text('100 mb', style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF))),
                    ],
                  ),
                  Switch(value: true, onChanged: (value) {}, activeColor: const Color(0xFF06B6D4)),
                ],
              ),
              const SizedBox(height: 24),
              const Text('4 Sessions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PodcastPlayerScreen())),
                child: _buildSessionItem('Train Whistle At Night', '15 mins • Free', true, false),
              ),
              const SizedBox(height: 12),
              _buildSessionItem('The Twilight Zone', '30 mins • Free', true, false),
              const SizedBox(height: 12),
              _buildSessionItem('Train Whistle At Night', 'Locked', false, true),
              const SizedBox(height: 12),
              _buildSessionItem('The Twilight Zone', 'Locked', false, true),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Text('Rate & review',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                    const SizedBox(height: 8),
                    const Text('Share your experience to help others',
                        style: TextStyle(fontSize: 14, color: Color(0xFF9CA3AF))),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Icon(
                          index < 3 ? Icons.star : Icons.star_border,
                          color: const Color(0xFF8B5CF6),
                          size: 32,
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text('4.7',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black)),
                  const SizedBox(width: 8),
                  const Icon(Icons.star, color: Color(0xFFFBBF24), size: 24),
                  const SizedBox(width: 8),
                  const Text('(28 Reviews)',
                      style: TextStyle(fontSize: 14, color: Color(0xFF9CA3AF))),
                ],
              ),
              const SizedBox(height: 20),
              _buildReviewItem('Marie Smith', '5.0',
                  'I try other meditation podcasts and always come back to this. Beautifully arranged and spoken. It got me there.',
                  'assets/images/s28.png'),
              const SizedBox(height: 16),
              _buildReviewItem('Jack Snow', '5.0',
                  'I use this most every morning to get me moving with whatever may be on my mind that needs attention',
                  'assets/images/s29.png'),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSessionItem(String title, String subtitle, bool isUnlocked, bool isLocked) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLocked ? const Color(0xFFF5F5F5) : const Color(0xFFE5F5FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isLocked ? const Color(0xFFE5E7EB) : const Color(0xFF6366F1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              isLocked ? Icons.lock : Icons.play_arrow,
              color: isLocked ? const Color(0xFF9CA3AF) : Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isLocked ? const Color(0xFF9CA3AF) : Colors.black)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: TextStyle(
                        fontSize: 12,
                        color: isLocked ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String name, String rating, String review, String avatarPath) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFFF8F9FF), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: const Color(0xFF06B6D4), borderRadius: BorderRadius.circular(8)),
                child: Image.asset(avatarPath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.person, color: Colors.white, size: 24)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(name,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                    color: const Color(0xFF8B5CF6), borderRadius: BorderRadius.circular(12)),
                child: Text(rating,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.star, color: Color(0xFFFBBF24), size: 16),
              const SizedBox(width: 4),
              Expanded(
                child: Text(review,
                    style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280), height: 1.4)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
