import 'package:get/get.dart';
import '../../data/models/medicine_model.dart';

class MedicineController extends GetxController {
  var isLoading = true.obs;
  var medicines = <MedicineModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMedicines();
  }

  void fetchMedicines() async {
    await Future.delayed(const Duration(seconds: 1)); // ⏳ Dummy delay (simulasi loading)

    // 💊 Dummy data (sementara sebelum backend Laravel)
    medicines.value = [
      MedicineModel(
        id: 1,
        name: "Paracetamol",
        type: "Tablet",
        description: "Obat penurun demam dan pereda nyeri ringan.",
        manufacturer: "Kimia Farma",
        price: 12000,
        photo: "https://i.imgur.com/Ws8rZzQ.png",
      ),
      MedicineModel(
        id: 2,
        name: "Amoxicillin",
        type: "Kapsul",
        description: "Antibiotik untuk mengobati infeksi bakteri.",
        manufacturer: "Sanbe Farma",
        price: 15000,
        photo: "https://i.imgur.com/nAiXlKf.png",
      ),
    ];

    isLoading.value = false;
  }
}
