import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  final VoidCallback onLoginTap;
  final String text1;
  final String text2;

  const LoginText({
    super.key,
    required this.onLoginTap,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ), // Normal text
        children: [
          TextSpan(
            text: text2,
            style: const TextStyle(
              color: Colors.blue, // Blue for "Log in"
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            recognizer: TapGestureRecognizer()..onTap = onLoginTap, // Tap event
          ),
        ],
      ),
    );
  }
}
