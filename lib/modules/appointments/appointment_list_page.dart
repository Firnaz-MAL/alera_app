import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../appointments/appointment_controller.dart';
import '../../data/models/appointment_model.dart';
import 'appointment_form_page.dart';

class AppointmentListPage extends StatelessWidget {
  final AppointmentController controller = Get.put(AppointmentController());

  AppointmentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Appointments",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Obx(() {
        if (controller.appointments.isEmpty) {
          return const Center(
            child: Text("No appointments yet 🩺",
                style: TextStyle(color: Colors.grey)),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.appointments.length,
          itemBuilder: (context, index) {
            final Appointment appointment = controller.appointments[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFFE3F2FD),
                  child: Icon(Icons.person, color: Colors.blue[700]),
                ),
                title: Text(appointment.doctorName,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text(
                    "${appointment.date} • ${appointment.time}\nPatient: ${appointment.patientName}",
                    style: const TextStyle(fontSize: 13, color: Colors.grey)),
                isThreeLine: true,
                trailing: Text(
                  appointment.status,
                  style: TextStyle(
                    color: appointment.status == "Confirmed"
                        ? Colors.green
                        : Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onLongPress: () =>
                    controller.removeAppointment(appointment.id), // delete
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[700],
        onPressed: () => Get.to(() => AppointmentFormPage()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
