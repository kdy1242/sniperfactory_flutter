
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('page 1'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.snackbar('내용 표시', '현재 디바이스 사이즈 : ${Get.width}, ${Get.height}');
          },
        ),
      ),
    );
  }
}
