// controllers/appointment_controller.dart
import 'package:get/get.dart';

class homepagecontroller extends GetxController {

  var categories = ["General", "ENT", "Dental", "Cardio"].obs;
  var images=["assets/bandage.png","assets/human.png","assets/tooth.png","assets/cardio.png"];
  var doctors = [
    {'name': 'Dr. John', 'specialization': 'Senior Doctor', 'timing': '7 am - 7 pm'},
    {'name': 'Dr. Jane', 'specialization': 'Pediatrician', 'timing': '9 am - 5 pm'},
    {'name': 'Dr. Jane', 'specialization': 'Pediatrician', 'timing': '9 am - 5 pm'},
    {'name': 'Dr. Jane', 'specialization': 'Pediatrician', 'timing': '9 am - 5 pm'},

  ].obs;



}
