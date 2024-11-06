import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/doc-list_controller.dart';
import 'appointment.dart';

class DoctorListView extends StatelessWidget {
  final DoctorController doctorController = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                doctorController.searchText.value = value;
              },
              decoration: InputDecoration(
                labelText: 'Search Doctor by Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: doctorController.filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctorController.filteredDoctors[index];
                  return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(
                        vertical: Get.height * 0.01,
                        horizontal: Get.width * 0.03,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doctor.name,
                                  style: TextStyle(
                                      fontSize: Get.width * 0.04,
                                      color: Colors.grey[700]),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  doctor.specialty,
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: Get.width * 0.04),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 5, top: 5, bottom: 5),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.to(AppointmentPage(
                                        doctorName: doctor.name,
                                        doctorSpecialty: doctor.specialty,
                                      ));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      "Book Appointment",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                  height: 30,
                                  width: 148,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Get.width * 0.02,
                                      vertical: Get.height * 0.005,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        doctor.schedule,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ));
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
