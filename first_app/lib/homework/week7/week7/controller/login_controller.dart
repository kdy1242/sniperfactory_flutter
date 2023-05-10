
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_controller.dart';

class LoginController extends GetxController {
  var idController = TextEditingController();
  var pwController = TextEditingController();
  RxBool saveToken = false.obs;

  login() async {
    Get.find<AuthController>().login(idController.text, pwController.text, saveToken.value);
  }
}
