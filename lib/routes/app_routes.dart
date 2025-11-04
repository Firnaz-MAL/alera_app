import 'package:alera_app/modules/auth/login_controller.dart';
import 'package:alera_app/modules/auth/login_page.dart';
import 'package:alera_app/modules/splash/splash_controller.dart';
import 'package:alera_app/modules/splash/splash_page.dart';
import 'package:alera_app/routes/app_pages.dart';
import 'package:get/get.dart';

class AppRoutes {
  static getRoutes() => [
    GetPage(
      name: AppPages.splash, 
      page:() => SplashPage(),
      binding: BindingsBuilder.put(() => SplashController())
    ),
    GetPage(
      name: AppPages.login, 
      page:() => LoginPage(),
      binding: BindingsBuilder.put(() => LoginController())
    ),

  ];
}