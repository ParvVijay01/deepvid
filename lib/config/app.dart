import 'package:deepvid/routes/app_pages.dart';
import 'package:deepvid/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DeepVid',
      theme: darkMode,
      initialRoute: AppPages.splash,
      defaultTransition: Transition.cupertino,
      getPages: AppPages.routes,
    );
  }
}
