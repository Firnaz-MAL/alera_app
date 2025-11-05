import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/patients/patient_controller.dart';
import '../../data/models/patient_model.dart';
import '../../utils/constants.dart';

class PatientDetailPage extends StatelessWidget {
  final int patientId;

  const PatientDetailPage({super.key, required this.patientId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PatientController>();
    final patient = controller.getPatientById(patientId);

    if (patient == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Patient Detail")),
        body: const Center(child: Text("Patient not found")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(patient.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _detailRow("Name", patient.name),
                _detailRow("Age", "${patient.age} years"),
                _detailRow("Gender", patient.gender),
                _detailRow("Diagnosis", patient.diagnosis),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  color: textColor, fontWeight: FontWeight.w600, fontSize: 16)),
          Text(value,
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 15)),
        ],
      ),
    );
  }
}
