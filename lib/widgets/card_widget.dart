import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AICreationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String badgeText;
  final String badgeIcon;
  final VoidCallback onTap;

  const AICreationCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.badgeText,
    required this.badgeIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(16),
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(20, 10, 29, 1),
              blurRadius: 1,
              spreadRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 500,
              ),
            ),

            // Gradient Overlay
            Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black45,
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            // Badge at the top-left
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      badgeIcon,
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(width: 6),
                    Text(
                      badgeText,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Text Content
            Positioned(
              bottom: 45,
              left: 16,
              right: 16, // Ensure it takes full width
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4), // Adds slight spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded( // Allows text to take available space
                        child: Text(
                          subtitle,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis, // Prevents overflow
                        ),
                      ),
                      SizedBox(width: 10), // Small spacing between text and icon
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(50, 50, 50, .9),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//505050DD