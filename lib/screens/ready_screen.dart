import 'package:flutter/material.dart';
import 'success_screen.dart';

class ReadyScreen extends StatefulWidget {
  const ReadyScreen({super.key});

  @override
  State<ReadyScreen> createState() => _ReadyScreenState();
}

class _ReadyScreenState extends State<ReadyScreen> {
  bool isLbs = true;
  double weight = 120;

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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SuccessScreen()),
              );
            },
            child: const Text(
              'Next',
              style: TextStyle(color: Color(0xFF8B5CF6), fontSize: 16),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Illustration
                Container(
                  width: 180,
                  height: 180,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFE5E5FF),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/s9.png',
                      width: 140,
                      height: 60,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: const Color(0xFF6366F1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            const Icon(
                              Icons.monitor_weight,
                              size: 60,
                              color: Colors.white,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Step
                const Text(
                  'STEP 1/7',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8B5CF6),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 10),

                // Title
                const Text(
                  'What is your weight?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 20),

                // Unit selector
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _unitButton('lbs', isLbs, () {
                      setState(() => isLbs = true);
                    }),
                    const SizedBox(width: 12),
                    _unitButton('kg', !isLbs, () {
                      setState(() => isLbs = false);
                    }),
                  ],
                ),

                const SizedBox(height: 30),

                // Weight display
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      weight.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        isLbs ? 'lbs' : 'kg',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Slider
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: const Color(0xFF6366F1),
                    inactiveTrackColor: const Color(0xFFE5E7EB),
                    thumbColor: const Color(0xFF6366F1),
                    overlayColor: const Color(0xFF6366F1).withOpacity(0.2),
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                    trackHeight: 4,
                  ),
                  child: Slider(
                    value: weight,
                    min: 80,
                    max: 200,
                    onChanged: (value) {
                      setState(() {
                        weight = value;
                      });
                    },
                  ),
                ),

                // Min and Max labels
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('110', style: TextStyle(fontSize: 14, color: Color(0xFF9CA3AF))),
                      Text('130', style: TextStyle(fontSize: 14, color: Color(0xFF9CA3AF))),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Continue Button
                SizedBox(
                  width: 280,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SuccessScreen()),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _unitButton(String label, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 45,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF6366F1) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isActive ? Colors.white : const Color(0xFF9CA3AF),
            ),
          ),
        ),
      ),
    );
  }
}