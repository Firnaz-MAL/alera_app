📂 STRUKTUR FOLDER
lib/
├── main.dart
├── data/
│   ├── api/                # nanti isinya endpoint dari backend Uwais
│   │   └── api_service.dart
│   └── models/             # sesuai tabel database
│       ├── user_model.dart
│       ├── patient_model.dart
│       ├── doctor_model.dart
│       ├── appointment_model.dart
│       ├── medical_record_model.dart
│       ├── medicine_model.dart
│       ├── prescription_model.dart
│       └── payment_model.dart
│
├── modules/                # folder untuk tiap halaman (UI)
│   ├── auth/
│   │   ├── login_page.dart
│   │   ├── register_page.dart
│   │   └── auth_controller.dart
│   │
│   ├── dashboard/
│   │   ├── dashboard_page.dart
│   │   └── dashboard_controller.dart
│   │
│   ├── patients/
│   │   ├── patient_list_page.dart
│   │   ├── patient_detail_page.dart
│   │   └── patient_controller.dart
│   │
│   ├── doctors/
│   │   ├── doctor_list_page.dart
│   │   ├── doctor_detail_page.dart
│   │   └── doctor_controller.dart
│   │
│   ├── appointments/
│   │   ├── appointment_list_page.dart
│   │   ├── appointment_form_page.dart
│   │   └── appointment_controller.dart
│   │
│   ├── medical_records/
│   │   ├── record_list_page.dart
│   │   ├── record_detail_page.dart
│   │   └── record_controller.dart
│   │
│   ├── medicines/
│   │   ├── medicine_list_page.dart
│   │   ├── medicine_form_page.dart
│   │   └── medicine_controller.dart
│   │
│   ├── payments/
│   │   ├── payment_page.dart
│   │   └── payment_controller.dart
│   │
│   └── profile/
│       ├── profile_page.dart
│       └── profile_controller.dart
│
├── routes/
│   ├── app_pages.dart      # daftar rute (routing)
│   └── app_routes.dart
│
├── utils/
│   ├── constants.dart      # warna, baseURL backend Uwais
│   ├── theme.dart          # styling umum
│   └── widgets.dart        # reusable widget (button, card, form)
│
└── bindings/
    └── app_bindings.dart   # dependency injection (GetX)

💡 PENJELASAN TIAP BAGIAN
Folder	Isi	Fungsinya
data/models/	Semua model sesuai tabel Uwais	Agar tiap data (user, patient, doctor, dll) bisa dikonversi dari/ke JSON dengan mudah
data/api/	Kumpulan endpoint API	Tempat Flutter manggil backend (misalnya login, ambil data pasien, dll)
modules/	Semua tampilan (UI) aplikasi	Dibagi berdasarkan fitur utama puskesmas
routes/	File rute halaman	Untuk navigasi antar halaman pakai GetX
utils/	Warna, tema, widget global	Biar desain UI kamu seragam
bindings/	Buat mengatur controller injection GetX	Agar tiap halaman otomatis load controllernya

🎯 ALUR KERJA TIM
Anggota	Fokus	Folder yang dipegang
Firnaz (UI Flutter)	Desain tampilan (frontend)	modules/, utils/, routes/
Uwais (Backend Laravel)	API, database, autentikasi JWT	Laravel project (app/Models, app/Controllers, routes/api.php)
Ibrahim (Fullstack)	Integrasi Flutter ↔ Laravel	data/api/, models/, controller (GetX logic)

🌐 KETERHUBUNGAN ANTARA UI DAN BACKEND
Tabel (Uwais)	Model (Flutter)	UI (Firnaz)
users	user_model.dart	login_page, register_page
patients	patient_model.dart	daftar pasien, form pasien
doctors	doctor_model.dart	daftar dokter
appointments	appointment_model.dart	halaman daftar & form pendaftaran
medical_records	medical_record_model.dart	halaman rekam medis
medicines	medicine_model.dart	daftar obat
prescriptions	prescription_model.dart	detail resep dokter
payments	payment_model.dart	halaman pembayaran & riwayat transaksi