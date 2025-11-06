import 'package:alera_app/modules/auth(ibrohim)/login_controller.dart';
import 'package:alera_app/modules/auth(ibrohim)/login_page.dart';
import 'package:alera_app/modules/auth(ibrohim)/register_controller.dart';
import 'package:alera_app/modules/auth(ibrohim)/register_page.dart';
import 'package:alera_app/modules/medical_records(Ibrohim)/record_controller.dart';
import 'package:alera_app/modules/medical_records(Ibrohim)/record_detail_page.dart';
import 'package:alera_app/modules/medical_records(Ibrohim)/record_list_page.dart';
import 'package:alera_app/modules/splash(firnaz)/splash_controller.dart';
import 'package:get/get.dart';

// Pages & Controllers
import 'package:alera_app/modules/splash(firnaz)/splash_page.dart';
import 'package:alera_app/modules/splash(firnaz)/splash_controller.dart';

import 'package:alera_app/modules/auth(ibrohim)/login_page.dart';
import 'package:alera_app/modules/auth(ibrohim)/login_controller.dart';

import 'package:alera_app/modules/dashboard(firnaz)/dashboard_page.dart';
import 'package:alera_app/modules/dashboard(firnaz)/dashboard_controller.dart';

// Appointments
import 'package:alera_app/modules/appointments/appointment_list_page.dart';
import 'package:alera_app/modules/appointments/appointment_controller.dart';

// Routes constants
import 'package:alera_app/routes/app_pages.dart';

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
  static List<GetPage<dynamic>> getRoutes() => [
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
          binding: BindingsBuilder(() {
            // bind DashboardController so DashboardPage can use Get.find()
            Get.put(DashboardController());
          }),
        ),

        // APPOINTMENTS
        GetPage(
          name: AppPages.appointments,
          page: () => AppointmentListPage(),
          binding: BindingsBuilder(() {
            Get.put(AppointmentController());
          }),
        ),

        // Optional: define placeholders for other routes to avoid runtime missing-route errors.
        // If you later add real pages, replace these with the real imports/pages.
        // GetPage(name: AppPages.patients, page: () => PatientsPage()),
        // GetPage(name: AppPages.doctors, page: () => DoctorsPage()),
        // GetPage(name: AppPages.medicines, page: () => MedicinesPage()),
        // GetPage(name: AppPages.medicalRecords, page: () => MedicalRecordsPage()),
        // GetPage(name: AppPages.payments, page: () => PaymentsPage()),
        // GetPage(name: AppPages.profile, page: () => ProfilePage()),
      ];
}
