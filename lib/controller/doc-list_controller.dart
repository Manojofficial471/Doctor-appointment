import 'package:get/get.dart';
import '../model/doc-list_model.dart';

class DoctorController extends GetxController {
  var doctors = <Doctor>[].obs;
  var filteredDoctors = <Doctor>[].obs;
  var searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();


    doctors.addAll([
      Doctor(name: "Dr. John", specialty: "Heart Specialist", schedule: "7 AM - 10 PM"),
      Doctor(name: "Dr. Jane", specialty: "Heart Specialist", schedule: "7 AM - 10 PM"),
      Doctor(name: "Dr. Mike", specialty: "Neurologist", schedule: "9 AM - 5 PM"),
      Doctor(name: "Dr. Sarah", specialty: "Dermatologist", schedule: "10 AM - 6 PM"),
      Doctor(name: "Dr. Emily", specialty: "Pediatrician", schedule: "8 AM - 4 PM"),
      Doctor(name: "Dr. Alex", specialty: "Orthopedic Surgeon", schedule: "9 AM - 5 PM"),
      Doctor(name: "Dr. Karen", specialty: "General Practitioner", schedule: "8 AM - 12 PM"),
      Doctor(name: "Dr. Thomas", specialty: "Cardiologist", schedule: "10 AM - 7 PM"),
      Doctor(name: "Dr. Lisa", specialty: "Ophthalmologist", schedule: "9 AM - 5 PM"),
      Doctor(name: "Dr. David", specialty: "Gastroenterologist", schedule: "1 PM - 6 PM"),
      Doctor(name: "Dr. Anna", specialty: "Endocrinologist", schedule: "8 AM - 2 PM"),
      Doctor(name: "Dr. Mark", specialty: "Oncologist", schedule: "10 AM - 4 PM"),
      Doctor(name: "Dr. Rachel", specialty: "Psychiatrist", schedule: "11 AM - 3 PM"),
      Doctor(name: "Dr. Henry", specialty: "Urologist", schedule: "9 AM - 3 PM"),
      Doctor(name: "Dr. Laura", specialty: "ENT Specialist", schedule: "8 AM - 1 PM"),
      Doctor(name: "Dr. Patricia", specialty: "Chiropractor", schedule: "10 AM - 6 PM"),
      Doctor(name: "Dr. George", specialty: "Plastic Surgeon", schedule: "12 PM - 8 PM"),
      Doctor(name: "Dr. Nancy", specialty: "Radiologist", schedule: "9 AM - 5 PM"),
      Doctor(name: "Dr. Matthew", specialty: "Nephrologist", schedule: "1 PM - 6 PM"),
      Doctor(name: "Dr. Sophie", specialty: "Pathologist", schedule: "10 AM - 5 PM"),

    ]);


    // Initial filtered list will display all doctors
    filteredDoctors.addAll(doctors);


    ever(searchText, (_) => filterDoctors());
  }


  void filterDoctors() {
    if (searchText.isEmpty) {
      filteredDoctors.assignAll(doctors); // Show all doctors if search text is empty
    } else {
      filteredDoctors.assignAll(
        doctors.where((doctor) =>
            doctor.name.toLowerCase().contains(searchText.value.toLowerCase())).toList(),
      );
    }
  }
}
