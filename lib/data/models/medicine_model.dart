// 🧩 Model Obat - MedicineModel (dummy-friendly & siap backend)
class MedicineModel {
  final int id;
  final String name;
  final String type; // tablet, kapsul, cair, dll
  final String description;
  final String manufacturer;
  final double price;
  final String photo;

  MedicineModel({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.manufacturer,
    required this.price,
    required this.photo,
  });

  // 🔁 JSON → Object
  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      description: json['description'] ?? '',
      manufacturer: json['manufacturer'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      photo: json['photo'] ?? '',
    );
  }

  // 🔁 Object → JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'description': description,
      'manufacturer': manufacturer,
      'price': price,
      'photo': photo,
    };
  }
}
