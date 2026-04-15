import 'package:flutter/material.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  int _selectedPlan = 0; // 0 = yearly, 1 = monthly

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top bar + illustration
              SizedBox(
                height: 260,
                child: Stack(
                  children: [
                    // Illustration image (person with pencil)
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/s19.png',
                        fit: BoxFit.contain,
                        alignment: Alignment.centerRight,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(Icons.draw, size: 80, color: Color(0xFF7B6FFF)),
                          );
                        },
                      ),
                    ),

                    // Wavy line painter overlay
                    Positioned.fill(
                      child: CustomPaint(painter: _WavyLinePainter()),
                    ),

                    // Decorative stars
                    const Positioned(
                      top: 80,
                      left: 50,
                      child: Icon(Icons.star, color: Color(0xFF4DD9C0), size: 14),
                    ),
                    const Positioned(
                      top: 120,
                      left: 90,
                      child: Icon(Icons.star, color: Color(0xFFD8B4FE), size: 10),
                    ),
                    const Positioned(
                      top: 60,
                      right: 100,
                      child: Icon(Icons.star, color: Color(0xFF7B6FFF), size: 10),
                    ),

                    // Top bar
                    Positioned(
                      top: 12,
                      left: 20,
                      right: 20,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.keyboard_arrow_down,
                                color: Colors.black, size: 28),
                          ),
                          const SizedBox(width: 12),
                          const Icon(Icons.star_border,
                              color: Color(0xFF7B6FFF), size: 22),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Headline
              const Text(
                'Go premium\nGet unlimited acces',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "When you subscribe, you'll gain\ninstant unlimited access",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9CA3AF),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 16),

              // Page indicator dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (i) {
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

              const SizedBox(height: 24),

              // Pricing plans
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Yearly plan
                    GestureDetector(
                      onTap: () => setState(() => _selectedPlan = 0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: _selectedPlan == 0
                                  ? const Color(0xFF7B6FFF)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: _selectedPlan == 0
                                    ? const Color(0xFF7B6FFF)
                                    : const Color(0xFFE5E7EB),
                                width: 2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\$4.99',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: _selectedPlan == 0
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '\$4.99/month, billed yearly \$60',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: _selectedPlan == 0
                                        ? Colors.white.withOpacity(0.85)
                                        : const Color(0xFF9CA3AF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SAVE 30% badge
                          Positioned(
                            top: -12,
                            right: 16,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFF4DD9C0),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'SAVE 30%',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Monthly plan
                    GestureDetector(
                      onTap: () => setState(() => _selectedPlan = 1),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: _selectedPlan == 1
                              ? const Color(0xFF7B6FFF)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: _selectedPlan == 1
                                ? const Color(0xFF7B6FFF)
                                : const Color(0xFFE5E7EB),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$5.99',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: _selectedPlan == 1
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Billed monthly \$5.99',
                              style: TextStyle(
                                fontSize: 13,
                                color: _selectedPlan == 1
                                    ? Colors.white.withOpacity(0.85)
                                    : const Color(0xFF9CA3AF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Go Premium button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.star, color: Colors.white, size: 20),
                    label: const Text(
                      'Go Premium',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5B4FCF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Subscription billed as one payment. Recurring\nbilling. Cancel anytime for any reason',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF9CA3AF),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Text('Terms',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  const Text(' • ',
                      style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF))),
                  GestureDetector(
                    onTap: () {},
                    child: const Text('Privacy Policy',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _WavyLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF7B6FFF)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(20, size.height * 0.75);
    path.cubicTo(
      size.width * 0.1, size.height * 0.2,
      size.width * 0.25, size.height * 0.95,
      size.width * 0.4, size.height * 0.45,
    );
    path.cubicTo(
      size.width * 0.5, size.height * 0.1,
      size.width * 0.6, size.height * 0.65,
      size.width * 0.7, size.height * 0.35,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
