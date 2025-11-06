import 'package:get/get.dart';
import '../../data/models/appointment_model.dart';

class AppointmentController extends GetxController {
  // Dummy data appointment
  final appointments = <Appointment>[
    Appointment(
      id: 1,
      patientName: "Uwais Al Qorni",
      doctorName: "Dr. Hana Nisa",
      date: "12 Nov 2025",
      time: "10:30 AM",
      status: "Confirmed",
    ),
    Appointment(
      id: 2,
      patientName: "Firnaz Rahman",
      doctorName: "Dr. Ahmad Yusuf",
      date: "14 Nov 2025",
      time: "01:00 PM",
      status: "Pending",
    ),
  ].obs;

  void addAppointment(Appointment appointment) {
    appointments.add(appointment);
  }

  void removeAppointment(int id) {
    appointments.removeWhere((a) => a.id == id);
  }
}
