// 📁 lib/data/models/doctor_model.dart

class DoctorModel {
  final int id;
  final String name;
  final String specialization;
  final String phone;
  final String email;
  final String photo;
  final String schedule;
  final String hospital;

  DoctorModel({
    required this.id,
    required this.name,
    required this.specialization,
    required this.phone,
    required this.email,
    required this.photo,
    required this.schedule,
    required this.hospital,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      specialization: json['specialization'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      photo: json['photo'] ?? '',
      schedule: json['schedule'] ?? '',
      hospital: json['hospital'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialization': specialization,
      'phone': phone,
      'email': email,
      'photo': photo,
      'schedule': schedule,
      'hospital': hospital,
    };
  }
}
