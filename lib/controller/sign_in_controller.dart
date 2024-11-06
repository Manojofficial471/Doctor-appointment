import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignUpController extends GetxController {
  // Text Editing Controllers for username and password fields
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  // Method to handle sign-up logic
  void signUp() {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    // Simple validation logic
    if (username.isEmpty) {
      Get.snackbar("Error", "Username cannot be empty",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (password.isEmpty) {
      Get.snackbar("Error", "Password cannot be empty",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    Get.snackbar("Success", "Account created successfully!",
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
