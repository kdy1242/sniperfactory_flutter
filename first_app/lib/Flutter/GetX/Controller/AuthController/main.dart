
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/main_controller.dart';
import 'view/login_page.dart';
import 'view/main_page.dart';

import 'controller/login_controller.dart';
import 'controller/auth_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => LoginController());
        Get.lazyPut(() => MainController());
      }),
      getPages: [
        GetPage(name: LoginPage.route, page: () => LoginPage()),
        GetPage(name: MainPage.route, page: () => MainPage()),
      ],
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () => Get.toNamed(LoginPage.route),
            child: Text('로그인하기'),
          ),
        ),
      ),
    );
  }
}
