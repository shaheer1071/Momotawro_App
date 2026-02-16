import 'package:flutter/material.dart';
import 'password_screen.dart'; // ✅ NEW SCREEN LINKED

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({super.key});

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
            onPressed: () {},
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Color(0xFF6366F1),
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
                'STEP 2/7',
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
                'Verify your number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'We\'ll text you on 03227740737',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6B7280),
                ),
              ),

              const SizedBox(height: 40),

              /// OTP BOXES
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildOTPBox('2'),
                  const SizedBox(width: 16),
                  _buildOTPBox('8'),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                'Send me a new code',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6366F1),
                  decoration: TextDecoration.underline,
                ),
              ),

              const SizedBox(height: 30),

              /// CONTINUE BUTTON → PASSWORD SCREEN
              SizedBox(
                width: 220,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PasswordScreen(),
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
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              _buildNumberPad(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOTPBox(String value) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(
          color: value.isNotEmpty
              ? const Color(0xFF6366F1)
              : const Color(0xFFE5E7EB),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
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