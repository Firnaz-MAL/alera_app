import 'dart:async';
import 'package:alera_app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';
import '../dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(26),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/logo/alera-bg-reamove.png',
                height: 90,
                width: 90,
              ),
            ),
            const SizedBox(height: 24),

            // NAMA APP
            Text(
              "Alera🌿",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: textColor,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),

            // SUBTITLE
            Text(
              "Pelayanan cepat, tanpa ribet",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 80),

            // LOADING BAR
            const CircularProgressIndicator(
              color: primaryColor,
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
