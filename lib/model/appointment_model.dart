
class Appointment {
  String doctorName;
  String doctorSpecialty;
  DateTime selectedDate;
  String patientMobile;
  String selectedHour;

  Appointment({
    required this.doctorName,
    required this.doctorSpecialty,
    required this.selectedDate,
    this.patientMobile = '',
    this.selectedHour = '',
  });
}
