import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Scrollable Content with Parallax Effect
          SingleChildScrollView(
            child: Column(
              children: [
                // Hero Section with Glow Effect
                Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: 1,
                      colors: [
                        Colors.deepPurple.withOpacity(0.8),
                        Colors.black,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ShaderMask(shaderCallback: (bounds) => LinearGradient(
                        colors: [Colors.white70, // Equivalent to white/80
                          Colors.white30],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ).createShader(bounds),child: Text(
                        "Create, Perform, and Entertain",

                        style: TextStyle(

                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),),
                      const SizedBox(height: 20),
                      const Text(
                        "Transform your creative vision into reality with AI-powered music and comedy production.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: const BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        child: const Text("Explore More", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.white30),
                // Scrollable Section
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black, // Different background for scrolling effect
                    child: Column(
                      children: [
                        ShaderMask(shaderCallback: (bounds) => LinearGradient(
                          colors: [
                            Color(0xFFFF33A1), // Vibrant Pink
                            Color(0xFFB13E8B), // Dark Pink
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds),
                          child: Text(
                            "Featured Creations",
                            style: TextStyle(
                              fontSize: 40, // Adjust as needed
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Necessary for ShaderMask to work
                            ),
                          ),),
                        SizedBox(height: 10,),
                        Text("Explore our collection of AI-generated content spanning music, comedy, and entertainment", style: TextStyle(color: Colors.white, fontSize: 15), textAlign: TextAlign.center,),
                      ],
                    )
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 3. Starry Animated Background
