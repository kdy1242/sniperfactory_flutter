
import 'controller/global_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GlobalDataController());

    return MaterialApp(
      home: MainPage(),
    );
  }
}
