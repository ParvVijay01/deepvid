import 'package:deepvid/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:deepvid/widgets/google_login_button.dart';
import 'package:deepvid/widgets/gradient_button.dart';
import 'package:deepvid/widgets/login_text.dart';
import 'package:deepvid/widgets/user_widget.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // State variable to control password field visibility
  bool _isEmailValid = false;

  @override
  void initState() {
    super.initState();
    // Add listener to validate email in real-time
    emailController.addListener(_validateEmail);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Email validation function
  void _validateEmail() {
    String email = emailController.text.trim();
    String emailPattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
    RegExp regex = RegExp(emailPattern);

    bool isValid = regex.hasMatch(email);

    // Ensure state updates only when validity changes
    if (isValid != _isEmailValid) {
      setState(() {
        _isEmailValid = isValid;
      });
    }
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
                  "Welcome Back to Your AI Creation Hub",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                Divider(endIndent: 250),
                Text(
                  "Log in to access tools for AI-generated music, comedy videos, and viral content creation. Perfect for Instagram, TikTok, and beyond!",
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
                            colors: [Colors.cyan, Colors.purple, Colors.orange],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds),
                      child: Text(
                        "Log in - Welcome back to DeepVid AI",
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
                        onLoginTap: () {Get.toNamed(AppPages.signUp);},
                        text1: "Don't have an account? ",
                        text2: "Sign up",
                      ),
                    ),
                    const SizedBox(height: 30),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "sherlock.holmes@domain.com",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 4,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),

                          // Show password field only when email is valid
                          AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            child:
                                _isEmailValid
                                    ? Column(
                                      key: ValueKey(
                                        1,
                                      ), // Ensures animation works
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 5,
                                            bottom: 5,
                                          ),
                                          child: Text(
                                            "Password",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        TextFormField(
                                          controller: passwordController,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            hintText: "Enter your password",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            prefixIcon: Icon(Icons.lock),
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                      ],
                                    )
                                    : SizedBox.shrink(),
                          ),

                          // Always visible login & Google Sign-In buttons
                          GradientButton(
                            text: "Log in",
                            onPressed: () {
                              
                            },
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
