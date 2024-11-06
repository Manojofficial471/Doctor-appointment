// views/appointment_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

import '../controller/appointment_controller.dart';
import 'homepage.dart';


class AppointmentPage extends StatelessWidget {
  final AppointmentController appointmentController = Get.put(AppointmentController());
  final String doctorName; // Add a field for doctor's name
  final String doctorSpecialty;

   AppointmentPage({super.key, required this.doctorName, required this.doctorSpecialty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment"),
        backgroundColor: Color(0xFF6451F1),
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor and Specialization
            SizedBox(
              width: Get.width,
              height: 80,
              child: Card(
                child: Column(
                  children: [
                    Text(
                      "$doctorName",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$doctorSpecialty",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Date Timeline Picker
            Obx(() {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Schedule: ${appointmentController.appointment.value.selectedDate.toLocal()}'.split(' ')[0],
                  style: TextStyle(fontSize: 20,color: Colors.green),
                ),
              );
            }),
            SizedBox(height: 10),
            EasyDateTimeLine(
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                appointmentController.updateDate(selectedDate);
              },
              headerProps: const EasyHeaderProps(
                monthPickerType: MonthPickerType.switcher,
                dateFormatter: DateFormatter.fullDateDMY(),
              ),
              dayProps: const EasyDayProps(
                dayStructure: DayStructure.dayStrDayNum,
                activeDayStyle: DayStyle(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff3371FF),
                        Color(0xff8426D6),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),


            Text(
              "Visit Hours",
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(() => VisitHourButton(
                  text: "7 AM",
                  selected: appointmentController.appointment.value.selectedHour == "7 AM",
                  onTap: () => appointmentController.updateSelectedHour("7 AM"),
                )),
                Obx(() => VisitHourButton(
                  text: "8 AM",
                  selected: appointmentController.appointment.value.selectedHour == "8 AM",
                  onTap: () => appointmentController.updateSelectedHour("8 AM"),
                )),
                Obx(() => VisitHourButton(
                  text: "9 AM",
                  selected: appointmentController.appointment.value.selectedHour == "9 AM",
                  onTap: () => appointmentController.updateSelectedHour("9 AM"),
                )),
              ],
            ),


            SizedBox(height: 20),


            Text(
              "Patient",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter the Mobile Number",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: (value) {
                appointmentController.updatePatientMobile(value);
              },
            ),
            SizedBox(height: 10),


            Expanded(
              child: ListView(
                children: [
                  PatientItem(mrd: "MRD23", name: "John Smith"),
                  SizedBox(height: 5),
                  PatientItem(mrd: "MRD25", name: "William"),
                ],
              ),
            ),
            SizedBox(height: 20),


            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  Get.defaultDialog(
                    title: "Appointment Booked",
                    content: Column(
                      children: [

                        Image.asset('assets/Sucess.jpg', height: 100),
                        SizedBox(height: 10),
                        Text(
                          "Your appointment has been booked successfully!",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    barrierDismissible: false,
                  );

                  // Navigate to Home Page after 3 seconds
                  Future.delayed(Duration(seconds: 3), () {
                    Get.to(HomePage());
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Color(0xFF6451F1),
                ),
                child: Text(
                  "Book Appointment",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class VisitHourButton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap; // Callback for button tap

  const VisitHourButton({required this.text, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 70,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: selected ? Color(0xFF6451F1) : Colors.grey.shade200,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

// Custom Widget for displaying patient MRD and Name
class PatientItem extends StatelessWidget {
  final String mrd;
  final String name;

  const PatientItem({required this.mrd, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(name),
                SizedBox(width: 15,),
                VerticalDivider(color: Colors.green,),
                Text(mrd)
              ],
            ),
            SizedBox(
              width: 90,
              height: 30,
              child: ElevatedButton(  onPressed: (){},  style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),child: Text("Select")),
            )
          ],
        ),
      ),
    );
  }
}
