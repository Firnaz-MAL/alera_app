import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../appointments/appointment_controller.dart';
import '../../data/models/appointment_model.dart';

class AppointmentFormPage extends StatefulWidget {
  const AppointmentFormPage({super.key});

  @override
  State<AppointmentFormPage> createState() => _AppointmentFormPageState();
}

class _AppointmentFormPageState extends State<AppointmentFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _patientController = TextEditingController();
  final _doctorController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final AppointmentController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Add Appointment",
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(_patientController, "Patient Name"),
              _buildTextField(_doctorController, "Doctor Name"),
              _buildTextField(_dateController, "Date (e.g. 12 Nov 2025)"),
              _buildTextField(_timeController, "Time (e.g. 10:00 AM)"),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newAppointment = Appointment(
                      id: DateTime.now().millisecondsSinceEpoch,
                      patientName: _patientController.text,
                      doctorName: _doctorController.text,
                      date: _dateController.text,
                      time: _timeController.text,
                      status: "Pending",
                    );
                    controller.addAppointment(newAppointment);
                    Get.back();
                  }
                },
                child: const Text("Save Appointment",
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: const Color(0xFFF7F9FC),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? 'This field is required' : null,
      ),
    );
  }
}
