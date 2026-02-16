import 'package:flutter/material.dart';
import 'otp_verification_screen.dart';

class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({super.key});

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
          width: 80,
          height: 4,
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
                MaterialPageRoute(
                  builder: (_) => const OTPVerificationScreen(),
                ),
              );
            },
            child: const Text(
              'Next',
              style: TextStyle(
                color: Color(0xFF6366F1), // purple shade
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              const Text(
                'STEP 1/7',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6B7280),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Let's start with your\nmobile number",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Number we can use to reach you',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6B7280),
                ),
              ),

              const SizedBox(height: 22),

              /// PHONE INPUT (SMALLER + CENTER)
              Container(
                width: 260,
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 22,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      '+92',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const SizedBox(
                      width: 130,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: '3227740737',
                          border: InputBorder.none,
                          hintStyle:
                          TextStyle(color: Color(0xFF9CA3AF)),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// VERIFY BUTTON (INPUT KE BILKUL NEECHE)
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const OTPVerificationScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6366F1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Verify Now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// NUMBER PAD
              _buildNumberPad(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberPad() {
    return Column(
      children: [
        _buildRow(['1', '2', '3']),
        const SizedBox(height: 10),
        _buildRow(['4', '5', '6']),
        const SizedBox(height: 10),
        _buildRow(['7', '8', '9']),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 48),
            _buildNumberButton('0'),
            _buildBackspaceButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildRow(List<String> numbers) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: numbers.map(_buildNumberButton).toList(),
    );
  }

  Widget _buildNumberButton(String number) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1F2937),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: const Icon(
        Icons.backspace_outlined,
        size: 20,
        color: Color(0xFF6B7280),
      ),
    );
  }
}