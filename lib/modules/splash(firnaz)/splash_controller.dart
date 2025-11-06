import 'dart:async';
import 'package:get/get.dart';
import 'package:alera_app/routes/app_pages.dart';

class SplashController extends GetxController {
  SplashController();

  @override
  void onInit() {
    super.onInit();

    // Setelah 2 detik pindah ke dashboard
    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed(AppPages.dashboard);
    });
  }
}
