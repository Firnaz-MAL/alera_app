import 'package:get/get.dart';
import '../../data/models/patient_model.dart';

// 🧠 Controller untuk mengatur data pasien
class PatientController extends GetxController {
  // 🧩 Dummy data pasien
  final patients = <Patient>[
    Patient(id: 1, name: "Aisyah Rahma", age: 25, gender: "Female", diagnosis: "Flu"),
    Patient(id: 2, name: "Ahmad Zaki", age: 30, gender: "Male", diagnosis: "Diabetes"),
    Patient(id: 3, name: "Fatimah Zahra", age: 40, gender: "Female", diagnosis: "Hypertension"),
  ].obs;

  Patient? getPatientById(int id) {
    return patients.firstWhereOrNull((p) => p.id == id);
  }
}
