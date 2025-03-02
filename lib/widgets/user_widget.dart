import 'package:flutter/material.dart';

class ProfileAvatarList extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/user1.png',
    'assets/images/user2.png',
    'assets/images/user3.png',
    'assets/images/user4.png',
  ];

  ProfileAvatarList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70, // Adjust based on avatar size
      width: 200,
      child: Stack(
        children:
            imagePaths.asMap().entries.map((entry) {
              int index = entry.key;
              String imagePath = entry.value;
              return Positioned(
                left: index * 40, // Overlapping effect by reducing spacing
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white, // Border color
                  child: CircleAvatar(
                    radius: 27,
                    backgroundImage: AssetImage(imagePath),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
