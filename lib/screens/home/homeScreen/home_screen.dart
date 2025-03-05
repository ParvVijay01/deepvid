import 'dart:math';

import 'package:deepvid/widgets/FAQSecrion.dart';
import 'package:deepvid/widgets/info_card.dart';
import 'package:deepvid/widgets/subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/card_carousel.dart';
import '../../../widgets/testimonial_carousel.dart';
import '../../../widgets/testimonial_carousel2.dart';

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
                      ShaderMask(
                        shaderCallback:
                            (bounds) => LinearGradient(
                              colors: [
                                Colors.white70, // Equivalent to white/80
                                Colors.white30,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ).createShader(bounds),
                        child: Text(
                          "Create, Perform, and Entertain",

                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Transform your creative vision into reality with AI-powered music and comedy production.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: const BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                        ),
                        child: const Text(
                          "Explore More",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.white30),
                // Scrollable Section
                Container(
                  height: MediaQuery.of(context).size.height * 6.01,
                  color:
                      Colors.black, // Different background for scrolling effect
                  child: Column(
                    children: [
                      ShaderMask(
                        shaderCallback:
                            (bounds) => LinearGradient(
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
                            color:
                                Colors
                                    .white, // Necessary for ShaderMask to work
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Explore our collection of AI-generated content spanning music, comedy, and entertainment",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      AICreationCarousel(
                        items: [
                          {
                            'imageUrl':
                                'https://w0.peakpx.com/wallpaper/695/286/HD-wallpaper-nobita-sad-bright-dope-popular-shizuka-trending.jpg',
                            'title': 'AI Creation #1',
                            'subtitle': 'Generated with Roast My Pic',
                            'badgeText': 'Roast My Pic',
                            'badgeIcon': 'assets/svg/fire.svg',
                          },
                          {
                            'imageUrl':
                                'https://w0.peakpx.com/wallpaper/695/286/HD-wallpaper-nobita-sad-bright-dope-popular-shizuka-trending.jpg',
                            'title': 'AI Creation #2',
                            'subtitle': 'Generated with Roast My Pic',
                            'badgeText': 'Roast My Pic',
                            'badgeIcon': 'assets/svg/fire.svg',
                          },
                          {
                            'imageUrl':
                                'https://w0.peakpx.com/wallpaper/695/286/HD-wallpaper-nobita-sad-bright-dope-popular-shizuka-trending.jpg',
                            'title': 'AI Creation #3',
                            'subtitle': 'Generated with Roast My Pic',
                            'badgeText': 'Roast My Pic',
                            'badgeIcon': 'assets/svg/fire.svg',
                          },
                        ],
                      ),
                      Divider(color: Colors.white30, thickness: 2),
                      SizedBox(height: 10),
                      Text(
                        "Powered by Cutting-Edge AI Technologies",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "We leverage the most advanced AI technologies to deliver innovative solutions across voice, language, music, video, and image generation.",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Divider(
                        color: Colors.white30,
                        indent: 90,
                        endIndent: 90,
                        thickness: 2,
                      ),
                      SizedBox(height: 5),
                      InfoCard(
                        icon: Icons.bolt_outlined,
                        title: "AI_powered Creation",
                        description:
                            "Harness the power of cutting-edge AI to transform your creative ideas into stunning visual and audio content with just a few clicks.",
                      ),
                      SizedBox(height: 10),
                      InfoCard(
                        icon: Icons.signal_cellular_alt_outlined,
                        title: "Engaging Content Creation",
                        description:
                            "Create captivating videos, music, and comedy content that resonates with your audience. Our AI tools help you produce viral-worthy entertainment effortlessly.",
                      ),
                      SizedBox(height: 10),
                      InfoCard(
                        icon: Icons.lock_outline,
                        title: "Professional Quality",
                        description:
                            "Our AI tools ensure that your content is of the highest quality, with professional-grade visuals and audio that captivate and engage your audience.",
                      ),
                      SizedBox(height: 10),
                      InfoCard(
                        icon: Icons.layers_outlined,
                        title: "Community Feedback",
                        description:
                            "Our platform allows you to get feedback from the community on your content, helping you improve and grow your audience.",
                      ),
                      SizedBox(height: 10),
                      InfoCard(
                        icon: Icons.verified_user_outlined,
                        title: "Real-time Generation",
                        description:
                            "Our AI tools generate content in real-time, allowing you to create and publish content quickly and efficiently.",
                      ),
                      SizedBox(height: 10),
                      InfoCard(
                        icon: Icons.auto_awesome_outlined,
                        title: "Easy Export",
                        description:
                            "Export your content in various formats, including video, audio, and text, allowing you to share your creations with ease.",
                      ),
                      SizedBox(height: 20),
                      Divider(color: Colors.white30, thickness: 2),


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,
                          vertical: 30,),
                        child: Center(
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Flexible Pricing for Every Creator",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Choose the perfect plan for your needs. Save up to 60% with yearly billing",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              SubscriptionScreen(),
                            ],
                          )
                        ),
                      ),
                      SizedBox(height: 10,),
                      Divider(color: Colors.white30, thickness: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // TESTIMONIALS SMALL TEXT
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 60,
                                  height: 2,
                                  color: Colors.purpleAccent,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "TESTIMONIALS",
                                  style: GoogleFonts.poppins(
                                    color: Colors.purpleAccent.shade100,
                                    fontSize: 15,
                                    letterSpacing: 2,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Container(
                                  width: 60,
                                  height: 2,
                                  color: Colors.purpleAccent,
                                ),
                              ],
                            ),

                            SizedBox(height: 10),

                            // WHAT CREATORS SAY (Gradient Text)
                            ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  colors: [
                                    Colors.white,
                                    Colors.purpleAccent.shade100,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ).createShader(bounds);
                              },
                              child: Text(
                                "What Creators Say",
                                style: GoogleFonts.poppins(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                            SizedBox(height: 10),

                            // DESCRIPTION TEXT
                            Text(
                              "Join thousands of visionary creators who are revolutionizing their content creation \n"
                              "process with our cutting-edge AI tools",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.grey.shade400,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: 15,),
                            TestimonialCarousel(),// Set any rating
                            SizedBox(height: 25,),
                            TestimonialCarousel2(),
                            SizedBox(height: 15,),

                            Divider(color: Colors.white30, thickness: 2),
                            SizedBox(height: 15,),
                            FAQSection(),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
