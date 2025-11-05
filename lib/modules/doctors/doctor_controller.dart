// 📁 lib/modules/doctors/doctor_controller.dart
import 'package:get/get.dart';
import '../../data/models/doctor_model.dart';

class DoctorController extends GetxController {
  var isLoading = true.obs;
  var doctors = <DoctorModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDoctors();
  }

  void fetchDoctors() async {
    await Future.delayed(const Duration(seconds: 1)); // simulasi loading
    doctors.value = [
      DoctorModel(
        id: 1,
        name: 'Dr. Ahmad Yusuf',
        specialization: 'Dokter Umum',
        phone: '08123456789',
        email: 'ahmad.yusuf@puskesmas.id',
        photo: 'https://i.pravatar.cc/150?img=12',
        schedule: 'Senin - Jumat, 08.00 - 15.00',
        hospital: 'Puskesmas Sehat Sentosa',
      ),
      DoctorModel(
        id: 2,
        name: 'Dr. Siti Rahma',
        specialization: 'Dokter Gigi',
        phone: '08234567890',
        email: 'siti.rahma@puskesmas.id',
        photo: 'https://i.pravatar.cc/150?img=32',
        schedule: 'Senin - Kamis, 09.00 - 14.00',
        hospital: 'Puskesmas Sehat Sentosa',
      ),
    ];
    isLoading.value = false;
  }
}
