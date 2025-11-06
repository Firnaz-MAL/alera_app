import 'package:get/get.dart';

/// Data dummy user sementara
class UserModel {
  int id;
  String name;
  String email;
  String role;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });
}

class ProfileController extends GetxController {
  // Dummy user data
  final Rx<UserModel> user = UserModel(
    id: 1,
    name: 'Firnaz Mustopa',
    email: 'firnaz@example.com',
    role: 'user',
  ).obs;

  /// Ubah nama user (dummy)
  void updateName(String newName) {
    user.update((val) {
      if (val != null) {
        val.name = newName;
      }
    });
  }

  /// Logout dummy
  void logout() {
    // Nanti bisa diganti navigasi login
    Get.snackbar('Logout', 'Kamu berhasil keluar.');
    // Get.offAllNamed('/login');
  }
}
