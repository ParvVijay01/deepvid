import 'dart:developer';

import 'package:deepvid/routes/app_pages.dart';
import 'package:deepvid/screens/auth/components/googleSignIn/google_sign_in.dart';
import 'package:deepvid/screens/home/homeScreen/home_screen.dart';
import 'package:deepvid/services/auth_service.dart';
import 'package:deepvid/widgets/google_login_button.dart';
import 'package:deepvid/widgets/gradient_button.dart';
import 'package:deepvid/widgets/login_text.dart';
import 'package:deepvid/widgets/my_text_field.dart';
import 'package:deepvid/widgets/user_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GoogleAuthService _googleAuthService = GoogleAuthService();
  final AuthService _authService = AuthService();
  // Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController vibeId = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Form Key
  final _formKey = GlobalKey<FormState>();

  // Email Validator
  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$', // Corrected regex
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  // Password Validator
  String? passwordValidator(String? value) {
    log("password ====> $value");
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  // State variables
  bool _isEmailValid = false;
  String? _errorMessage; // Stores error messages

  // Handle Google Sign-In with error handling
  void _handleGoogleSignIn() async {
    setState(() {
      _errorMessage = null; // Reset error message
    });

    try {
      User? user = await _googleAuthService.signInWithGoogle();
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } catch (error) {
      setState(() {
        _errorMessage = error.toString(); // Set error message for display
      });

      // Show error as Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString()), backgroundColor: Colors.red),
      );
    }
  }

  //Dispose -
  @override
  void dispose() {
    nameController.dispose();
    lastName.dispose();
    vibeId.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }


//Handle sign up
  void _handleSignup() async {
    // Log the current values of the controllers for debugging
    log("Before validation: ${nameController.text}, ${lastName.text}, ${vibeId.text}, ${emailController.text}, ${passwordController.text}");

    // Validate the form
    if (_formKey.currentState!.validate()) {
      log("Form is valid. Proceeding with signup...");

      // Log user details
      log("User  details -----> ${nameController.text.trim()}, ${lastName.text.trim()}, ${vibeId.text.trim()}, ${emailController.text.trim()}, ${passwordController.text.trim()}");

      try {
        // Call the signUpWithEmail method from AuthService
        User? user = await _authService.signUpWithEmail(
          nameController.text.trim(),
          lastName.text.trim(),
          vibeId.text.trim(),
          emailController.text.trim(),
          passwordController.text.trim(),
        );

        // Check if the user was created successfully
        if (user != null) {
          // Navigate to the HomeScreen if signup is successful
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      } catch (error) {
        // Log the error and show a Snackbar with the error message
        log("Signup Error: $error");
        setState(() => _errorMessage = error.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_errorMessage ?? "An error occurred"), backgroundColor: Colors.red),
        );
      }
    } else {
      log("Form is not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png", height: 150, width: 150),
              Text(
                "Start Creating AI-Generated Content Today",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                textAlign: TextAlign.center,
              ),
              Divider(endIndent: 250),
              Text(
                "Sign up now to generate AI-powered music, comedy shows, and videos. Share your creations on Instagram, TikTok, and YouTube.",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileAvatarList(),
                  Text(
                    "Be among the first ones to test Deepvid.ai",
                    style: TextStyle(color: Color(0xff9ca3ae), fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Divider(),
              const SizedBox(height: 15),
              ShaderMask(
                shaderCallback:
                    (bounds) => LinearGradient(
                      colors: [Colors.cyan, Colors.purple, Colors.orange],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds),
                child: Text(
                  "Sign up - Start journey with DeepVid AI",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: LoginText(
                  onLoginTap: () => Get.toNamed(AppPages.login),
                  text1: "Already have an account? ",
                  text2: "Log in",
                ),
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 10),
                      child: Text(
                        "First Name",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    MyTextField(
                      controller: nameController,
                      hintText: 'Sherlock',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "This field is required";
                        } else if (value.length < 2) {
                          return "First name must be at least 2 characters";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      obscureText: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                        bottom: 5,
                        top: 15,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Last Name",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            " (Optional)",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyTextField(
                      controller: lastName,
                      hintText: 'Holmes',
                      obscureText: false,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 5),
                      child: Text(
                        "Vibe ID",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    MyTextField(
                      controller: vibeId,
                      hintText: 'holmes_detective007',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "This field is required";
                        } else if (value.length < 3) {
                          return "Your Vibe ID must be at least 3 characters";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      obscureText: false,
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 5),
                      child: Text(
                        "Email Address",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    MyTextField(
                      controller: emailController,
                      hintText: 'sherlock.holmes@domain.com',
                      validator: emailValidator,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    const SizedBox(height: 15),

                    Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 5),
                      child: Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Enter new password',
                      obscureText: true,
                      validator: passwordValidator,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 5),
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    MyTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm new password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (value) {
                        log("confirm password ===> $value");
                        if (confirmPasswordController.text !=
                            passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    GradientButton(
                      text: "Create Account",
                      onPressed: _handleSignup,
                    ),
                    const SizedBox(height: 20),
                    GoogleLoginButton(onGoogleSignIn: _handleGoogleSignIn),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
