
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController pwConfirmController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  signUp() {
    String email = emailController.text.trim();
    String password = pwController.text.trim();
    String passwordConfirm = pwConfirmController.text.trim();
    String username = userNameController.text.trim();

    if (!isEmailValid(email)) {
      // 이메일이 올바른 형식이 아닌 경우
      snackBar('이메일이 비어있거나 올바른 형식이 아닌듯?');
      return false;
    }

    if (password.length < 9) {
      // 비밀번호가 9자 미만인 경우
      snackBar('비밀번호가 비어있거나 9글자 미만인듯?');
      return false;
    }

    if (password != passwordConfirm) {
      // 비밀번호와 비밀번호 확인이 일치하지 않는 경우
      snackBar('비밀번호가 일치하지 않는듯?');
      return false;
    }

    Get.find<AuthController>().signUp(email, password, passwordConfirm, username);

    return true;
  }

  bool isEmailValid(String email) {
    // 이메일 형식이 올바른지 확인하는 정규식
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegExp.hasMatch(email);
  }

  void snackBar(String message) {
    Get.snackbar('제대로 입력하쇼', message);
  }
}
