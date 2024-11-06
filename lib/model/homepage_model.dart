// models/doctor_model.dart
class DoctorModel {
  String name;
  String specialization;
  String timing;

  DoctorModel({required this.name, required this.specialization, required this.timing});


  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'],
      specialization: json['specialization'],
      timing: json['timing'],
    );
  }

  // Method to convert Doctor object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'specialization': specialization,
      'timing': timing,
    };
  }
}
