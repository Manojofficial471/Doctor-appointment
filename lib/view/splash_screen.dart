import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splash_screen.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Book Appointment",
              style: TextStyle(
                  color: Colors.indigo ,
                  fontSize: 45,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 35,),
          Column(
            children: [
              Text("Book Doctor's Appointment For ", style: TextStyle(
                color: Colors.black,
                fontSize: 20,)), Text("the patients ", style: TextStyle(
                color: Colors.black,
                fontSize: 20,)),
            ],
          )
            ,

            SizedBox(height: 20,),
            SizedBox(
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {

                    Get.to(LoginView());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.indigo,
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
