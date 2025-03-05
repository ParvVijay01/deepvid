import 'dart:async';
import 'package:deepvid/services/auth_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:deepvid/screens/auth/login/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentScreen = 0; // Tracks the current splash screen
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Change screens every 3 seconds, then navigate to login after 9 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentScreen < 2) {
        setState(() {
          _currentScreen++; // Move to the next splash screen
        });
      } else {
        _timer.cancel(); // Stop timer after last splash screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AuthChecker(),
          ), // Navigate to login
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel timer when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> splashData = [
      {
        "svg": "assets/svg/splash1.svg",
        "title": "Welcome!",
        "description": "Discover AI for creations.",
      },
      {
        "svg": "assets/svg/splash2.svg",
        "title": "Smart and Powerful",
        "description": "Experience the future of AI-driven innovation.",
      },
      {
        "svg": "assets/svg/splash3.svg",
        "title": "Create with AI",
        "description": "Turn ideas into stunning visuals with the power of AI.",
      },
    ];

    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: SplashPage(
            key: ValueKey(_currentScreen), // Ensures smooth transition
            svg: splashData[_currentScreen]["svg"]!,
            title: splashData[_currentScreen]["title"]!,
            description: splashData[_currentScreen]["description"]!,
          ),
        ),
      ),
    );
  }
}

// Reusable Splash Page Widget
class SplashPage extends StatelessWidget {
  final String svg;
  final String title;
  final String description;

  const SplashPage({
    required Key key,
    required this.svg,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: SvgPicture.asset(svg, width: 300, key: ValueKey(svg)),
        ),
        SizedBox(height: 20),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: Text(
            title,
            key: ValueKey(title),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: Text(
            description,
            key: ValueKey(description),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
