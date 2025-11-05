// 💳 Payment Model (Dummy Data Sementara)

class Payment {
  final int id;
  final String patientName;
  final String doctorName;
  final double amount;
  final DateTime date;
  bool isCheckedIn;
  bool isCheckedOut;

  Payment({
    required this.id,
    required this.patientName,
    required this.doctorName,
    required this.amount,
    required this.date,
    this.isCheckedIn = false,
    this.isCheckedOut = false,
  });
}
