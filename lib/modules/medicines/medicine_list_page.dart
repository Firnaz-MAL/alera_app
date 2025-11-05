import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';
import 'medicine_controller.dart';

class MedicineListPage extends StatelessWidget {
  const MedicineListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MedicineController());

    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        title: const Text("Daftar Obat 💊"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: primaryColor));
        }

        if (controller.medicines.isEmpty) {
          return const Center(
            child: Text(
              "Belum ada data obat.",
              style: TextStyle(fontFamily: 'Poppins', color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.medicines.length,
          itemBuilder: (context, index) {
            final medicine = controller.medicines[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(defaultRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  radius: 26,
                  backgroundColor: primaryColor.withOpacity(0.15),
                  backgroundImage: NetworkImage(medicine.photo),
                ),
                title: Text(
                  medicine.name,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                subtitle: Text(
                  medicine.type,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => Get.toNamed('/medicine-detail', arguments: medicine),
                  child: const Text(
                    "Detail",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
