import 'package:alera_app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();

  @override
  void onInit() {
    navigateToLogin();
    super.onInit();
  }

  void navigateToLogin() {
    Future.delayed(Duration(seconds: 4), () {
      Get.offNamed(AppPages.login);
    });
  }
}
