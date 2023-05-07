
import 'package:first_app/Flutter/GetX/Controller/PageController/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(LoginController());
    // var controller = Get.find<LoginController>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: controller.idController,
                decoration: InputDecoration(
                  hintText: 'ID'
                ),
              ),
              TextField(
                controller: controller.pwController,
                decoration: InputDecoration(
                    hintText: 'PW'
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: controller.login,
                child: Text('로그인하기'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
