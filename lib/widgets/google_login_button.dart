import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleLoginButton extends StatelessWidget {
  final VoidCallback onGoogleSignIn;

  const GoogleLoginButton({super.key, required this.onGoogleSignIn});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Divider with "Or login with"
        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey[700], thickness: 1)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Or login with",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            Expanded(child: Divider(color: Colors.grey[700], thickness: 1)),
          ],
        ),
        const SizedBox(height: 15),

        // Google Button
        SizedBox(
          width: double.infinity, // Full-width button
          child: ElevatedButton(
            onPressed: onGoogleSignIn,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Dark background
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: Colors.grey),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Google Logo SVG
                SvgPicture.asset(
                  "assets/svg/google.svg", // Place your Google logo SVG here
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Continue with Google",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
