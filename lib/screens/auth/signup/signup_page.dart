import 'package:deepvid/routes/app_pages.dart';
import 'package:deepvid/widgets/google_login_button.dart';
import 'package:deepvid/widgets/gradient_button.dart';
import 'package:deepvid/widgets/login_text.dart';
import 'package:deepvid/widgets/my_text_field.dart';
import 'package:deepvid/widgets/user_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController vibeId = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();

  // Form Key
  final _formKey = GlobalKey<FormState>();

  //Email Validator
  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    // Regular expression for validating an email
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null; // Valid email
  }

  // Password validator -
  String? passwordValidator(String? value) {
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

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null; // Valid password
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/images/logo.png"),
                  height: 150,
                  width: 150,
                ),
                Text(
                  "Start Creating AI-Generated Content Today",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                Divider(endIndent: 250),
                Text(
                  "Sign up now to generate AI-powered music, comedy shows, and videos. Share your creations on your favorite platform like Instagram, TikTok, and YouTube.",
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
                    const SizedBox(height: 15),
                    Divider(),
                    const SizedBox(height: 15),
                    ShaderMask(
                      shaderCallback:
                          (bounds) => LinearGradient(
                            colors: [
                              Colors.cyan,
                              Colors.purple,
                              Colors.orange,
                            ], // Gradient Colors
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds),
                      child: Text(
                        "Sign up - Start journey with DeepVid AI",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Required for ShaderMask
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: LoginText(
                        onLoginTap: () {
                          Get.toNamed(AppPages.login);
                        },
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
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "This field is required";
                              } else if (value.length > 2) {
                                return "First name must be at least 2 characters";
                              }
                              return null;
                            },
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
                            keyboardType: TextInputType.text,
                            obscureText: false,
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
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "This field is required";
                              } else if (value.length > 3) {
                                return "Your Vibe ID must be atleast 3 characters";
                              }
                              return null;
                            },
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
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            validator: emailValidator,
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
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: false,
                            validator: passwordValidator,
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
                            controller: conformPasswordController,
                            hintText: 'Confirm new password',
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: false,
                            validator: (value) {
                              if (value != passwordController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30),
                          GradientButton(
                            text: "Create Account",
                            onPressed: () {},
                          ),
                          SizedBox(height: 20),
                          GoogleLoginButton(onGoogleSignIn: () {}),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
