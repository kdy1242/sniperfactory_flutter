
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController pwConfirmController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  signUp () {
    Get.find<AuthController>().signUp(emailController.text, pwController.text, pwController.text, userNameController.text);
  }
}
