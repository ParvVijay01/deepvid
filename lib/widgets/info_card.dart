import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const InfoCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topLeft,  // Adjust based on the glow position
          radius: 1.5,  // Controls spread of glow
          colors: [
            Colors.deepPurple.withOpacity(0.1), // Subtle purple glow
            Colors.black,  // Main dark background
          ],
        ),// Dark background
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row to push the icon to the right
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1), // Slightly visible background
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Colors.purple, // Icon color
                  size: 24,
                ),
              ),
            ],
          ),
          SizedBox(height: 8), // Spacing between icon and text

          // Text content
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6), // Spacing between title and description
          Text(
            description,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
