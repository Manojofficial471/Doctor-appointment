import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/homepage_controller.dart';
import 'doctors_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _screens = [
    HomeScreen(),
    DoctorListView(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  // Track the selected index
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home-button.png',
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/nurse.png',
              width: 24,
              height: 24,
            ),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/medical-appointment.png',
              width: 24,
              height: 24,
            ),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/user.png',
              width: 24,
              height: 24,
            ),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Update the selected index
          });
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final homepagecontroller controller = Get.put(homepagecontroller());
  final List<String> images = [
    "assets/bandage.png",
    "assets/human.png",
    "assets/tooth.png",
    "assets/cardio.png"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: Get.height * 0.4,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.menu, color: Colors.white),
                      CircleAvatar(
                        child: Text('DR'),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 25, color: Colors.grey[700]),
                ),
                SizedBox(height: 10),
                Text(
                  'Let\'s Book The  \n Appointment',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Categories..',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.search, size: 40),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Categories',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(controller.categories.length, (index) {
            return CategoryCard(
              title: controller.categories[index],
              imagePath: images[index],
            );
          }),
        )),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Doctors',
                style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text("All"),
                  SizedBox(width: 3),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10),
        Obx(() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: controller.doctors
                  .map((doctor) => DoctorCard(
                name: doctor['name'] ?? 'No Name',
                specialization: doctor['specialization'] ?? 'Unknown Specialization',
                timing: doctor['timing'] ?? 'No Timing',
              ))
                  .toList(),
            ),
          ),
        )),
      ],
    );
  }
}


class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const CategoryCard({Key? key, required this.title, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(15),
            child: Image.asset(
              imagePath,
              height: 30,
              width: 30,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(title),
      ],
    );
  }
}


class DoctorCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String timing;

  const DoctorCard({Key? key, required this.name, required this.specialization, required this.timing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(specialization, style: TextStyle(color: Colors.blueAccent)),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFD700),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Text(timing, style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}



class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Settings Screen'));
  }
}


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Screen'));
  }
}
