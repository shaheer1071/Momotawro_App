import 'package:flutter/material.dart';

class SharePlaylistScreen extends StatelessWidget {
  const SharePlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.black, size: 30),
                  ),
                  const Icon(Icons.download,
                      color: Color(0xFF7B6FFF), size: 26),
                ],
              ),
            ),

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Let's share",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Playlist card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Illustration header
                    Container(
                      height: 160,
                      decoration: const BoxDecoration(
                        color: Color(0xFF9B8FFF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Stack(
                        children: [
                          // Star decoration
                          const Positioned(
                            top: 30,
                            left: 30,
                            child: Icon(Icons.star,
                                color: Color(0xFF7B6FFF), size: 36),
                          ),
                          // Illustration image
                          Positioned.fill(
                            child: Image.asset(
                              'assets/images/s20.png',
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(Icons.person,
                                      size: 80, color: Colors.white),
                                );
                              },
                            ),
                          ),
                          // Scalloped bottom edge
                          Positioned(
                            bottom: -1,
                            left: 0,
                            right: 0,
                            child: CustomPaint(
                              size: const Size(double.infinity, 20),
                              painter: _ScallopPainter(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Card content
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Category + rating row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'WELLNESS',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF7B6FFF),
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEDE9FE),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Color(0xFF7B6FFF), size: 14),
                                    SizedBox(width: 4),
                                    Text(
                                      '5.0',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF7B6FFF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          // Title
                          const Text(
                            'Sleep With Me\nBedtime Stories',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              height: 1.3,
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Track list
                          _buildTrack('1', 'Mindfullness of Breath', '10 mins'),
                          const SizedBox(height: 12),
                          _buildTrack('2', 'A Meditation Lullaby', '5 mins'),
                          const SizedBox(height: 12),
                          _buildTrack('3', 'The Twilight Zone', '10 mins'),

                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Page dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: i == 3 ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: i == 3
                        ? const Color(0xFF7B6FFF)
                        : const Color(0xFFE5E7EB),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),

            const Spacer(),

            // Share buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _shareButton(
                    color: const Color(0xFF7B6FFF),
                    icon: Icons.chat_bubble,
                  ),
                  const SizedBox(width: 16),
                  _shareButtonText(
                    color: const Color(0xFF25D366),
                    label: 'W',
                  ),
                  const SizedBox(width: 16),
                  _shareButton(
                    color: const Color(0xFF1877F2),
                    icon: Icons.facebook,
                  ),
                  const SizedBox(width: 16),
                  _shareButton(
                    color: const Color(0xFF1DA1F2),
                    icon: Icons.flutter_dash,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrack(String number, String title, String duration) {
    return Row(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF9CA3AF),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          duration,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF9CA3AF),
          ),
        ),
      ],
    );
  }

  Widget _shareButton({required Color color, required IconData icon}) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon, color: Colors.white, size: 28),
    );
  }

  Widget _shareButtonText({required Color color, required String label}) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Scalloped edge painter for the card illustration
class _ScallopPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    final path = Path();
    const scallopWidth = 20.0;
    final count = (size.width / scallopWidth).ceil();

    path.moveTo(0, size.height);
    for (int i = 0; i < count; i++) {
      final x = i * scallopWidth;
      path.arcToPoint(
        Offset(x + scallopWidth, size.height),
        radius: const Radius.circular(10),
        clockwise: false,
      );
    }
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
