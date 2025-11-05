import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/payments/payment_controller.dart';
import '../../utils/constants.dart';
import 'package:intl/intl.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Payments"),
      ),
      body: Obx(() {
        final payments = controller.payments;

        if (payments.isEmpty) {
          return const Center(child: Text("No payments available"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(defaultPadding),
          itemCount: payments.length,
          itemBuilder: (context, index) {
            final p = payments[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🧾 Header info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          p.patientName,
                          style: const TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Rp ${p.amount.toStringAsFixed(0)}",
                          style: const TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Doctor: ${p.doctorName}",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateFormat('dd MMM yyyy, HH:mm').format(p.date),
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                      ),
                    ),

                    const Divider(height: 24),

                    // 🟢 Status Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _statusChip(
                          label: p.isCheckedIn
                              ? (p.isCheckedOut ? "Checked Out" : "Checked In")
                              : "Not Checked In",
                          color: p.isCheckedOut
                              ? Colors.redAccent
                              : p.isCheckedIn
                                  ? Colors.orangeAccent
                                  : Colors.grey.shade300,
                          textColor: p.isCheckedIn
                              ? Colors.white
                              : Colors.grey.shade700,
                        ),
                        Row(
                          children: [
                            // 🕒 Check In Button
                            ElevatedButton(
                              onPressed: () =>
                                  controller.toggleCheckIn(p.id),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: p.isCheckedIn
                                    ? Colors.grey.shade400
                                    : primaryColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(defaultRadius),
                                ),
                              ),
                              child: Text(p.isCheckedIn
                                  ? "Undo Check-In"
                                  : "Check-In"),
                            ),
                            const SizedBox(width: 8),
                            // ✅ Check Out Button
                            ElevatedButton(
                              onPressed: p.isCheckedIn
                                  ? () => controller.toggleCheckOut(p.id)
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: p.isCheckedOut
                                    ? Colors.grey.shade400
                                    : primaryColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(defaultRadius),
                                ),
                              ),
                              child: Text(p.isCheckedOut
                                  ? "Undo Check-Out"
                                  : "Check-Out"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  Widget _statusChip({
    required String label,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }
}
