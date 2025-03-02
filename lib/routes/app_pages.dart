import 'package:deepvid/screens/auth/login/login_page.dart';
import 'package:deepvid/screens/auth/signup/signup_page.dart';
import 'package:get/get.dart';

class AppPages {
  static const login = '/login';
  static const signUp = '/signUp';

  static final routes = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: signUp, page: () => SignupPage()),
  ];
}
