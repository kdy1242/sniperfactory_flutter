
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../firebase_options.dart';
import 'create_page.dart';
import 'delete_page.dart';
import 'read_page.dart';
import 'update_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // 메인 함수에 비동기 함수 있으면 추가해줘야함
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Get.to(() => CreatePage());
              },
              child: Text('create'),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => ReadPage());
              },
              child: Text('read'),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => UpdatePage());
              },
              child: Text('update'),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => DeletePage());
              },
              child: Text('delete'),
            ),
          ],
        ),
      ),
    );
  }
}
