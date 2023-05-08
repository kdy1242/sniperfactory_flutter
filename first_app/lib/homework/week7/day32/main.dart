
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'util/app_routes.dart';
import 'view/page/login_page.dart';
import 'view/page/main_page.dart';
import 'controller/auth_controller.dart';
import 'controller/login_controller.dart';
import 'controller/main_controller.dart';

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
        GetPage(name: AppRoutes.login, page: () => LoginPage()),
        GetPage(name: AppRoutes.main, page: () => MainPage()),
      ],
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () => Get.toNamed(AppRoutes.login),
            child: Text('로그인하기'),
          ),
        ),
      ),
    );
  }
}
