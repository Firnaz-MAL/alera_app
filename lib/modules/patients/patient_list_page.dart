import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/patients/patient_controller.dart';
import '../../utils/constants.dart';
import 'patient_detail_page.dart';

class PatientListPage extends StatelessWidget {
  const PatientListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PatientController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Patient List"),
      ),
      body: Obx(() {
        final patients = controller.patients;

        if (patients.isEmpty) {
          return const Center(child: Text("No patients available"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(defaultPadding),
          itemCount: patients.length,
          itemBuilder: (context, index) {
            final patient = patients[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  radius: 26,
                  backgroundColor: secondaryColor,
                  child: Icon(
                    Icons.person_outline,
                    color: primaryColor,
                    size: 26,
                  ),
                ),
                title: Text(
                  patient.name,
                  style: const TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                subtitle: Text(
                  "${patient.age} years • ${patient.gender}",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios,
                    size: 18, color: Colors.grey.shade400),
                onTap: () => Get.to(() => PatientDetailPage(patientId: patient.id)),
              ),
            );
          },
        );
      }),
    );
  }
}
