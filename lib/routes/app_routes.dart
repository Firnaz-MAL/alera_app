import 'package:alera_app/modules/auth(ibrohim)/login_controller.dart';
import 'package:alera_app/modules/auth(ibrohim)/login_page.dart';
import 'package:alera_app/modules/dashboard(firnaz)/dashboard_page.dart';
import 'package:alera_app/modules/splash(firnaz)/splash_controller.dart';
import 'package:alera_app/modules/splash(firnaz)/splash_page.dart';
import 'package:alera_app/routes/app_pages.dart';
import 'package:get/get.dart';

class AppRoutes {
  static getRoutes() => [
        // SPLASH
        GetPage(
          name: AppPages.splash,
          page: () => const SplashPage(),
          binding: BindingsBuilder(() {
            Get.put(SplashController());
          }),
        ),

        // LOGIN
        GetPage(
          name: AppPages.login,
          page: () => LoginPage(),
          binding: BindingsBuilder(() {
            Get.put(LoginController());
          }),
        ),

        // DASHBOARD
        GetPage(
          name: AppPages.dashboard,
          page: () => const DashboardPage(),
        ),
      ];
}
