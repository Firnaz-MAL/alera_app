import 'package:alera_app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  LoginController();

  void navigateToRegisterForm() {
    Get.toNamed(AppPages.register);
  }

  
}