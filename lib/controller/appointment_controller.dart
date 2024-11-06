// controllers/appointment_controller.dart
import 'package:get/get.dart';

import '../model/appointment_model.dart';

class AppointmentController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<String> selectedHour = ''.obs;
  var appointment = Appointment(
    doctorName: '',
    doctorSpecialty: '',
    selectedDate: DateTime.now(),
  ).obs;

  void updateDate(DateTime date) {
    appointment.update((val) {
      val?.selectedDate = date;
    });
  }

  void updatePatientMobile(String mobile) {
    appointment.update((val) {
      val?.patientMobile = mobile;
    });
  }

  void updateSelectedHour(String hour) {
    appointment.update((val) {
      val?.selectedHour = hour;
    });
  }
}
