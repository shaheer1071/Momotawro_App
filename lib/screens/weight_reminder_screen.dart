import 'package:flutter/material.dart';

class WeightReminderScreen extends StatefulWidget {
  const WeightReminderScreen({super.key});

  @override
  State<WeightReminderScreen> createState() => _WeightReminderScreenState();
}

class _WeightReminderScreenState extends State<WeightReminderScreen> {
  final Map<String, bool> _days = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': true,
    'Friday': true,
    'Saturday': true,
    'Sunday': false,
  };

  int get _selectedCount => _days.values.where((v) => v).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back arrow
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.keyboard_arrow_down,
                    color: Colors.black, size: 30),
              ),
            ),

            // Illustration
            Center(
              child: SizedBox(
                height: 160,
                width: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Lightning bolts
                    const Positioned(
                      left: 10,
                      top: 20,
                      child: Icon(Icons.bolt,
                          color: Color(0xFF4DD9C0), size: 40),
                    ),
                    const Positioned(
                      left: 30,
                      top: 50,
                      child: Icon(Icons.bolt,
                          color: Color(0xFF4DD9C0), size: 32),
                    ),
                    const Positioned(
                      top: 10,
                      left: 60,
                      child: Text('+',
                          style: TextStyle(
                              fontSize: 24,
                              color: Color(0xFF9CA3AF),
                              fontWeight: FontWeight.w300)),
                    ),
                    // Person illustration
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Image.asset(
                        'assets/images/s35.png',
                        width: 110,
                        height: 130,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => Container(
                          width: 110,
                          height: 130,
                          decoration: BoxDecoration(
                            color: const Color(0xFF7B6FFF).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(Icons.person,
                              size: 60, color: Color(0xFF7B6FFF)),
                        ),
                      ),
                    ),
                    // Chat bubble
                    Positioned(
                      right: 0,
                      top: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.check, color: Color(0xFF7B6FFF), size: 12),
                            SizedBox(width: 2),
                            Icon(Icons.check, color: Color(0xFF7B6FFF), size: 12),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Title
            const Center(
              child: Text(
                'Weight Reminder',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Subtitle
            const Center(
              child: Text(
                'Choose a day to weigh yourself and we\nwill send you the reminder',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9CA3AF),
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 28),

            // Selected day count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'SELECTED DAY ($_selectedCount)',
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF7B6FFF),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Days grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _buildDayTile('Monday')),
                      const SizedBox(width: 16),
                      Expanded(child: _buildDayTile('Friday')),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(child: _buildDayTile('Tuesday')),
                      const SizedBox(width: 16),
                      Expanded(child: _buildDayTile('Saturday')),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(child: _buildDayTile('Wednesday')),
                      const SizedBox(width: 16),
                      Expanded(child: _buildDayTile('Sunday')),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(child: _buildDayTile('Thursday')),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Set reminder button
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7B6FFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Set reminder',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayTile(String day) {
    final isSelected = _days[day] ?? false;
    return GestureDetector(
      onTap: () => setState(() => _days[day] = !isSelected),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF7B6FFF)
                  : const Color(0xFFEDE9FE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: isSelected
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : null,
          ),
          const SizedBox(width: 10),
          Text(
            day,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.black : const Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }
}
