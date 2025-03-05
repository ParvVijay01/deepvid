import 'dart:async';
import 'package:flutter/material.dart';

import 'card_widget.dart';

class AICreationCarousel extends StatefulWidget {
  final List<Map<String, String>> items;

  const AICreationCarousel({Key? key, required this.items}) : super(key: key);

  @override
  _AICreationCarouselState createState() => _AICreationCarouselState();
}

class _AICreationCarouselState extends State<AICreationCarousel> {
  late PageController _pageController;
  int currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9); // Slightly smaller width

    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (currentIndex < widget.items.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      _pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550, // Adjust height as needed
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.items.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return AICreationCard(
            imageUrl: item['imageUrl']!,
            title: item['title']!,
            subtitle: item['subtitle']!,
            badgeText: item['badgeText']!,
            badgeIcon: item['badgeIcon']!,
            onTap: () {
              print("Tapped on ${item['title']}");
            },
          );
        },
      ),
    );
  }
}
