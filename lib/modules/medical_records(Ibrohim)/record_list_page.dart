import 'package:alera_app/routes/app_pages.dart';
import 'package:alera_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';// Import constants untuk menggunakan primaryColor
import 'record_controller.dart';
import 'record_detail_page.dart';

class RecordListPage extends GetView<RecordController> {
  const RecordListPage({super.key});

  // Helper method untuk menampilkan dialog form statis
  void _showAddRecordDialog(BuildContext context) {
    // Gunakan TextEditingController untuk input statis (hanya menampung nilai)
    final titleController = TextEditingController();
    final dateController = TextEditingController();
    final doctorController = TextEditingController();
    final notesController = TextEditingController();

    // Menggunakan Get.dialog untuk menampilkan AlertDialog
    Get.dialog(
      AlertDialog(
        // Menggunakan shape dari CardTheme yang sudah diatur (defaultRadius)
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        title: Text(
          'Tambah Catatan Medis Baru',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Judul
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Judul Catatan',
                ),
              ),
              const SizedBox(height: 16),
              // Tanggal
              TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Pemeriksaan',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true, // Anggap sebagai input Date Picker statis
                onTap: () {
                  Get.snackbar('Demo', 'Fitur memilih tanggal belum diimplementasikan.');
                },
              ),
              const SizedBox(height: 16),
              // Nama Dokter
              TextField(
                controller: doctorController,
                decoration: const InputDecoration(
                  labelText: 'Nama Dokter/Petugas',
                ),
              ),
              const SizedBox(height: 16),
              // Ringkasan/Catatan
              TextField(
                controller: notesController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Ringkasan/Catatan',
                  alignLabelWithHint: true,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          // Tombol Batal (TextButton)
          TextButton(
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Batal'),
          ),
          // Tombol Simpan (Menggunakan style dari ElevatedButtonTheme)
          ElevatedButton(
            onPressed: () {
              // Karena statis, kita hanya menutup dialog dan menampilkan notifikasi
              Get.back(); 
              Get.snackbar(
                'Simpan Data (Statis)',
                'Catatan "${titleController.text.isEmpty ? "Baru" : titleController.text}" berhasil disimulasikan.',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Theme.of(context).colorScheme.primary,
                colorText: Colors.white,
              );
            },
            // Style akan diwarisi dari ElevatedButtonThemeData yang Anda buat
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // Memastikan Controller sudah diinisialisasi (jika belum di binding sebelumnya)
    if (Get.isRegistered<RecordController>()) {
      Get.find<RecordController>();
    } else {
      Get.put(RecordController());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Medis'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          // Menggunakan CircularProgressIndicator standar (diwarisi dari theme)
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.medicalRecords.isEmpty) {
          return Center(
            child: Text(
              'Belum ada catatan medis.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: controller.medicalRecords.length,
          itemBuilder: (context, index) {
            final record = controller.medicalRecords[index];
            return Card(
              // Menggunakan CardTheme yang sudah disetel
              child: ListTile(
                leading: Icon(
                  Icons.receipt_long,
                  color: Theme.of(context).colorScheme.primary, // Sesuai primaryColor
                ),
                title: Text(
                  record.title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                subtitle: Text('Dokter: ${record.doctor}\nTanggal: ${record.date}'),
                isThreeLine: true,
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // Navigasi ke detail page menggunakan GetX
                  Get.toNamed(AppPages.recordDetail, arguments: record.id);
                },
              ),
            );
          },
        );
      }),
      // Contoh Floating Action Button yang mengikuti ElevatedButtonTheme
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddRecordDialog(context), // Panggil dialog helper
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
        // Style FAB mengambil dari theme
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
    );
  }
}