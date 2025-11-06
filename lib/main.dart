import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alera_app/routes/app_pages.dart';
import 'package:alera_app/routes/app_routes.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alera',
      theme: aleraTheme,
      getPages: AppRoutes.getRoutes(),
      initialRoute: AppPages.splash, // ⬅️ mulai dari SplashPage
    );
  }
}
