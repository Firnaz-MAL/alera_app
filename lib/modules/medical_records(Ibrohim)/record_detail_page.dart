import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'record_controller.dart';

class RecordDetailPage extends GetView<RecordController> {
  const RecordDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil ID dari argumen navigasi GetX
    final int recordId = Get.arguments as int;

    // Ambil data catatan medis dari Controller
    final MedicalRecord? record = controller.getRecordById(recordId);

    if (record == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detail Catatan')),
        body: const Center(
          child: Text('Catatan medis tidak ditemukan.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(record.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 📝 Judul Catatan Utama
            Text(
              record.title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 16),
            // 📄 Detail Informasi
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow(context, 'Tanggal Pemeriksaan', record.date),
                    Divider(color: Theme.of(context).dividerColor),
                    _buildDetailRow(context, 'Dokter/Petugas', record.doctor),
                    Divider(color: Theme.of(context).dividerColor),
                    _buildDetailRow(
                        context, 'ID Catatan', '#${record.id.toString()}'),
                    Divider(color: Theme.of(context).dividerColor),
                    // ✏️ Contoh Konten Detail
                    const Text('Ringkasan Hasil:', style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    Text(
                      'Pasien menunjukkan hasil yang stabil. Direkomendasikan untuk melakukan follow-up dalam 6 bulan ke depan. Tidak ada anomali signifikan yang terdeteksi pada pemeriksaan hari ini.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // 🔗 Tombol Aksi (menggunakan ElevatedButtonTheme)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.snackbar('Aksi', 'Mendownload ${record.title}...');
                },
                icon: const Icon(Icons.download),
                label: const Text('Download Laporan (PDF)'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper untuk membuat baris detail
  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}