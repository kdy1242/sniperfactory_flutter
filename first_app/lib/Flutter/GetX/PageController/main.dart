
import 'package:first_app/Flutter/GetX/PageController/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'page/login_page.dart';
import 'page/main_page.dart';
import 'util/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController());
      }),
      getPages: AppPages.pages,
      home: LoginPage(),
      // initialRoute: LoginPage.route,
    );
  }
}
