
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../firebase_options.dart';
import 'controller/auth_controller.dart';
import 'controller/profile_edit_controller.dart';
import 'page/login_page.dart';
import 'page/main_page.dart';
import 'page/profile_edit_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // 메인 함수에 비동기 함수 있으면 추가해줘야함
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => ProfileEditController(), fenix: true);
      }),
      getPages: [
        GetPage(name: '/', page: () => const LoginPage()),
        GetPage(name: '/main', page: () => const MainPage()),
        GetPage(name: '/edit/profile', page: () => const ProfileEditPage()),
      ],
      initialRoute: '/',
    );
  }
}
