import 'package:deepvid/screens/auth/login/login_page.dart';
import 'package:deepvid/screens/auth/signup/signup_page.dart';
import 'package:deepvid/screens/forgotPassword/forgot_password.dart';
import 'package:deepvid/screens/home/homeScreen/home_screen.dart';
import 'package:deepvid/screens/splashScreen/splash_screen.dart';
import 'package:deepvid/services/auth_checker.dart';
import 'package:get/get.dart';

class AppPages {
  static const login = '/login';
  static const signUp = '/signUp';
  static const splash = '/splash';
  static const home = '/home';
  static const auth = '/auth';
  static const forgotPassword = '/forgotPassword';

  static final routes = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: signUp, page: () => SignupPage()),
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: auth, page: () => AuthChecker()),
    GetPage(name: forgotPassword, page: () => ForgotPasswordScreen()),


  ];
}
