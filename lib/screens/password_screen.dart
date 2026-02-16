import 'package:flutter/material.dart';
import 'fingerprint_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  String password = '';
  final int maxLength = 6;

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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'STEP 6/7',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF6366F1),
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Set your password',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 40),

            // PASSWORD DOTS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(maxLength, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < password.length
                        ? const Color(0xFF6366F1)
                        : const Color(0xFFE5E7EB),
                  ),
                );
              }),
            ),

            const SizedBox(height: 30),

            // REQUIREMENTS
            Column(
              children: const [
                _RequirementRow(text: '8+ characters'),
                SizedBox(height: 6),
                _RequirementRow(text: '1 uppercase'),
                SizedBox(height: 6),
                _RequirementRow(text: '1 number'),
              ],
            ),

            const SizedBox(height: 30),

            // CONTINUE BUTTON
            SizedBox(
              width: 220,
              height: 50,
              child: ElevatedButton(
                onPressed: password.length >= 6
                    ? () {
                  // ✅ Navigate to Fingerprint screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const FingerprintScreen()),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6366F1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // CUSTOM KEYBOARD
            _buildKeyboard(),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyboard() {
    return Column(
      children: [
        _buildKeyRow(['Q','W','E','R','T','Y','U','I','O','P']),
        const SizedBox(height: 8),
        _buildKeyRow(['A','S','D','F','G','H','J','K','L']),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSpecialKey(Icons.keyboard_arrow_up, () {}),
            ...['Z','X','C','V','B','N','M'].map(_buildKey).toList(),
            _buildSpecialKey(Icons.backspace, () {
              if (password.isNotEmpty) {
                setState(() {
                  password = password.substring(0, password.length - 1);
                });
              }
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildKeyRow(List<String> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys.map(_buildKey).toList(),
    );
  }

  Widget _buildKey(String key, {double width = 32}) {
    return GestureDetector(
      onTap: () {
        if (password.length < maxLength) {
          setState(() {
            password += key;
          });
        }
      },
      child: Container(
        width: width,
        height: 38,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            key,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1F2937),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpecialKey(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          icon,
          size: 20,
          color: const Color(0xFF6B7280),
        ),
      ),
    );
  }
}

class _RequirementRow extends StatelessWidget {
  final String text;
  const _RequirementRow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.check_circle, size: 16, color: Color(0xFF6366F1)),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 14, color: Color(0xFF6366F1)),
        ),
      ],
    );
  }
}