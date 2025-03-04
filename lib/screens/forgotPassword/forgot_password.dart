import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    void _showMessage(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }

    void _sendPasswordResetEmail() async {
      String email = _emailController.text.trim();

      if (email.isEmpty) {
        _showMessage("Please enter your email");
        return;
      }

      try {
        await _auth.sendPasswordResetEmail(email: email);
        _showMessage("Password reset link sent! Check your email.");
      } catch (e) {
        _showMessage("Error: ${e.toString()}");
      }
    }


    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2b0d1e), // Dark background
        body: Column(
          children: [
            // Logo at the top
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 40), // Add spacing from the top
                child: Container(
                  padding: EdgeInsets.all(4), // Space between avatar and border
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.pinkAccent, // Border color
                      width: 3, // Border width
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.5), // Glow effect
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 90,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/logo.png'), // Your logo
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Centered Main Content
            Expanded(
              child: Center( // Ensures everything is centered
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                      crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                      children: [
                        // Gradient Forgot Password Text
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: [Colors.purpleAccent, Colors.redAccent], // Gradient colors
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ).createShader(bounds);
                          },
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Set to white to make gradient visible
                            ),
                          ),
                        ),
                        SizedBox(height: 8),

                        // Subtitle
                        Text(
                          "Enter your email to reset your password",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.mail_outline, size: 25,),
                              SizedBox(width: 5,),
                              Text("Email", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                        // Email Input Field
                        TextField(
                          controller: _emailController,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(

                            hintText: "Sherlock.holmes@domain.com",
                            hintStyle: TextStyle(color: Colors.white),
                            filled: true,
                            fillColor: Colors.black45,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.grey, width: 4),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Reset Button
                    GestureDetector(
                      onTap: _sendPasswordResetEmail,
                      child: Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), // Rounded corners
                          gradient: const LinearGradient(
                            colors: [Color(0xFF9B51E0), Color(0xFFE91E63)], // Purple to Pink
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple.withOpacity(0.3), // Soft shadow
                              blurRadius: 10,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.send, color: Colors.white, size: 22), // Icon
                            SizedBox(width: 8),
                            Text(
                              "Send Reset Link",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                        // Back to Login
                        TextButton.icon(
                          onPressed: () {
                            Navigator.pop(context); // Go back to login
                          },
                          icon: Icon(Icons.arrow_back, color: Colors.purpleAccent),
                          label: Text(
                            "Back to Login",
                            style: TextStyle(color: Colors.purpleAccent),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
