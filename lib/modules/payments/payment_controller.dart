import 'package:get/get.dart';
import '../../data/models/payment_model.dart';

// 🧭 Controller untuk mengatur data Payment
class PaymentController extends GetxController {
  // 💰 Dummy Data Payment
  final payments = <Payment>[
    Payment(
      id: 1,
      patientName: "Ahmad Zaki",
      doctorName: "Dr. Fatimah Zahra",
      amount: 200000,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Payment(
      id: 2,
      patientName: "Aisyah Rahma",
      doctorName: "Dr. Yusuf Karim",
      amount: 150000,
      date: DateTime.now(),
    ),
    Payment(
      id: 3,
      patientName: "Abdul Malik",
      doctorName: "Dr. Hana Lestari",
      amount: 250000,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ].obs;

  // 🔁 Check In & Check Out
  void toggleCheckIn(int id) {
    final index = payments.indexWhere((p) => p.id == id);
    if (index != -1) {
      payments[index].isCheckedIn = !payments[index].isCheckedIn;
      if (!payments[index].isCheckedIn) {
        payments[index].isCheckedOut = false;
      }
      payments.refresh();
    }
  }

  void toggleCheckOut(int id) {
    final index = payments.indexWhere((p) => p.id == id);
    if (index != -1 && payments[index].isCheckedIn) {
      payments[index].isCheckedOut = !payments[index].isCheckedOut;
      payments.refresh();
    }
  }
}
