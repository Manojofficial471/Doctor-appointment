import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/login_model.dart';
import '../view/homepage.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Method to handle login functionality
  void login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter both username and password');
    } else {

      UserModel user = UserModel(username: username, password: password);

      Get.to(HomePage());
      Get.snackbar('Login Successful', 'Welcome ${user.username}!');
    }

   }


  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
