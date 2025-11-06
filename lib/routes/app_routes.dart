import 'package:alera_app/modules/auth(ibrohim)/login_controller.dart';
import 'package:alera_app/modules/auth(ibrohim)/login_page.dart';
import 'package:alera_app/modules/auth(ibrohim)/register_controller.dart';
import 'package:alera_app/modules/auth(ibrohim)/register_page.dart';
import 'package:alera_app/modules/medical_records(Ibrohim)/record_controller.dart';
import 'package:alera_app/modules/medical_records(Ibrohim)/record_detail_page.dart';
import 'package:alera_app/modules/medical_records(Ibrohim)/record_list_page.dart';
import 'package:alera_app/modules/splash(firnaz)/splash_controller.dart';
import 'package:alera_app/modules/splash(firnaz)/splash_page.dart';
import 'package:alera_app/routes/app_pages.dart';
import 'package:get/get.dart';

class AppRoutes {
  static getRoutes() => [
    GetPage(
      name: AppPages.splash,
      page: () => SplashPage(),
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
    ),
    GetPage(
      name: AppPages.login,
      page: () => LoginPage(),
      binding: BindingsBuilder(() {
        Get.put(LoginController());
      }),
    ),
    GetPage(
      name: AppPages.register,
      page: () => RegisterPage(),
      binding: BindingsBuilder(() {
        Get.put(RegisterController());
      }),
    ),
    GetPage(
      name: AppPages.recordDetail,
      page: () => RecordDetailPage(),
      binding: BindingsBuilder(() {
        Get.put(RecordController());
      }),
    ),
    GetPage(
      name: AppPages.recordList,
      page: () => RecordListPage(),
      binding: BindingsBuilder(() {
        Get.put(RecordController());
      }),
    ),
  ];
}
