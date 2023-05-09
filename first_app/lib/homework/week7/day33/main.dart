
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/auth_controller.dart';
import 'controller/login_controller.dart';
import 'controller/sign_up_controller.dart';
import 'controller/secret_controller.dart';
import 'controller/upload_controller.dart';
import 'util/pages.dart';
import 'view/page/login_page.dart';

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
          Get.lazyPut(() => LoginController(), fenix: true);
          Get.lazyPut(() => SignUpController(), fenix: true);
          Get.lazyPut(() => SecretController(), fenix: true);
          Get.lazyPut(() => UploadController(), fenix: true);
        }),
      getPages: AppPages.pages,
      home: LoginPage()
    );
  }
}
