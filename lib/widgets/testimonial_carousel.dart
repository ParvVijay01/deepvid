import 'dart:async';
import 'package:flutter/material.dart';

class Testimonial {
  final String profileImage;
  final String name;
  final String designation;
  final String testimonial;
  final int rating;

  Testimonial({
    required this.profileImage,
    required this.name,
    required this.designation,
    required this.testimonial,
    this.rating = 5,
  });
}

class TestimonialCarousel extends StatefulWidget {
  @override
  _TestimonialCarouselState createState() => _TestimonialCarouselState();
}

class _TestimonialCarouselState extends State<TestimonialCarousel> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  late Timer _timer;
  int currentPage = 0;

  final List<Testimonial> testimonials = [
    Testimonial(
      profileImage: "assets/images/user1.png",
      name: "Amelia Clark",
      designation: "SEO Analyst",
      testimonial: "The AI-powered insights improved my content's visibility like never before.",
      rating: 5,
    ),
    Testimonial(
      profileImage: "assets/images/user2.png",
      name: "John Doe",
      designation: "Marketing Specialist",
      testimonial: "I love how intuitive and effective this tool is for analytics.",
      rating: 4,
    ),
    Testimonial(
      profileImage: "assets/images/user4.png",
      name: "Lisa Brown",
      designation: "Content Creator",
      testimonial: "An absolute game-changer for my social media strategy!",
      rating: 5,
    ),
    Testimonial(
      profileImage: "assets/images/user1.png",
      name: "Lisa Brown",
      designation: "Content Creator",
      testimonial: "An absolute game-changer for my social media strategy!",
      rating: 5,
    ),
    Testimonial(
      profileImage: "assets/images/user2.png",
      name: "Lisa Brown",
      designation: "Content Creator",
      testimonial: "An absolute game-changer for my social media strategy!",
      rating: 5,
    ),
    Testimonial(
      profileImage: "assets/images/user3.png",
      name: "Lisa Brown",
      designation: "Content Creator",
      testimonial: "An absolute game-changer for my social media strategy!",
      rating: 5,
    ),
    Testimonial(
      profileImage: "assets/images/user1.png",
      name: "Lisa Brown",
      designation: "Content Creator",
      testimonial: "An absolute game-changer for my social media strategy!",
      rating: 5,
    ),Testimonial(
      profileImage: "assets/images/user2.png",
      name: "Lisa Brown",
      designation: "Content Creator",
      testimonial: "An absolute game-changer for my social media strategy!",
      rating: 5,
    ),Testimonial(
      profileImage: "assets/images/user3.png",
      name: "Lisa Brown",
      designation: "Content Creator",
      testimonial: "An absolute game-changer for my social media strategy!",
      rating: 5,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      if (_pageController.hasClients) {
        int nextPage = currentPage + 1;

        if (nextPage >= testimonials.length) {
          // Smoothly reset to first card
          nextPage = 0;
        }

        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 1500),
          curve: Curves.easeInOut,
        );

        setState(() {
          currentPage = nextPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        itemCount: testimonials.length,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TestimonialCard(testimonial: testimonials[index]),
          );
        },
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;

  const TestimonialCard({Key? key, required this.testimonial}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1A1A2E), Color(0xFF2A0845)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(testimonial.profileImage),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testimonial.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    testimonial.designation,
                    style: TextStyle(color: Colors.grey[400], fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            testimonial.testimonial,
            style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14),
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(
              testimonial.rating,
                  (index) => const Icon(Icons.star, color: Colors.amber, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}
