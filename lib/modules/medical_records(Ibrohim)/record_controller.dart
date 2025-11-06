import 'package:get/get.dart';

class MedicalRecord {
  final int id;
  final String title;
  final String date;
  final String doctor;

  MedicalRecord({
    required this.id,
    required this.title,
    required this.date,
    required this.doctor,
  });
}

class RecordController extends GetxController {
RecordController();

  // Obx (Observables) untuk menyimpan daftar catatan medis
  final RxList<MedicalRecord> medicalRecords = <MedicalRecord>[].obs;
  // Obx untuk status loading
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRecords();
  }

  // Simulasi pengambilan data catatan medis
  void fetchRecords() async {
    isLoading.value = true;
    // Simulasi penundaan jaringan
    await Future.delayed(const Duration(seconds: 2));

    // Data dummy
    final List<MedicalRecord> dummyRecords = [
      MedicalRecord(
          id: 1,
          title: 'Hasil Lab Darah Lengkap',
          date: '10 Nov 2025',
          doctor: 'Dr. Sarah Wijaya'),
      MedicalRecord(
          id: 2,
          title: 'Rekam Jantung (EKG)',
          date: '25 Sep 2025',
          doctor: 'Dr. Budi Santoso'),
      MedicalRecord(
          id: 3,
          title: 'Riwayat Vaksinasi COVID-19',
          date: '01 Jan 2025',
          doctor: 'Perawat Siti'),
    ];

    medicalRecords.assignAll(dummyRecords);
    isLoading.value = false;
  }

  // Fungsi untuk mendapatkan detail catatan berdasarkan ID (digunakan di Detail Page)
  MedicalRecord? getRecordById(int id) {
    return medicalRecords.firstWhereOrNull((record) => record.id == id);
  }
}