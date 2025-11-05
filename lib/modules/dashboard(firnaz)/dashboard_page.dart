import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Scaffold(
      backgroundColor: secondaryColor, // 🌿 sama kayak splash
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🌿 HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo kecil + Nama
                  Row(
                    children: [
                      Container(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Image.asset(
                            'assets/logo/alera-bg-reamove.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Alera🌿",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            "Selamat datang, ${controller.userName}",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Icon profil
                  IconButton(
                    icon: const Icon(Icons.person_outline, color: primaryColor),
                    onPressed: () => Get.toNamed('/profile'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 🌿 MENU GRID
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildDashboardCard(
                      icon: Icons.people_outline,
                      label: 'Pasien',
                      color: Colors.tealAccent.shade100,
                      onTap: () => Get.toNamed('/patients'),
                    ),
                    _buildDashboardCard(
                      icon: Icons.local_hospital_outlined,
                      label: 'Dokter',
                      color: Colors.lightBlueAccent.shade100,
                      onTap: () => Get.toNamed('/doctors'),
                    ),
                    _buildDashboardCard(
                      icon: Icons.calendar_month_outlined,
                      label: 'Janji Temu',
                      color: Colors.greenAccent.shade100,
                      onTap: () => Get.toNamed('/appointments'),
                    ),
                    _buildDashboardCard(
                      icon: Icons.medication_outlined,
                      label: 'Obat',
                      color: Colors.orangeAccent.shade100,
                      onTap: () => Get.toNamed('/medicines'),
                    ),
                    _buildDashboardCard(
                      icon: Icons.receipt_long_outlined,
                      label: 'Rekam Medis',
                      color: Colors.purpleAccent.shade100,
                      onTap: () => Get.toNamed('/medical_records'),
                    ),
                    _buildDashboardCard(
                      icon: Icons.payments_outlined,
                      label: 'Pembayaran',
                      color: Colors.pinkAccent.shade100,
                      onTap: () => Get.toNamed('/payments'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(icon, color: primaryColor, size: 32),
            ),
            const SizedBox(height: 14),
            Text(
              label,
              style: const TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
