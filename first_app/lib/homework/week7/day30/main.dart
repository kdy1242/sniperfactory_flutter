
import 'package:first_app/homework/week7/day30/controller/coin_controller.dart';
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

    Get.put(CoinController());

    return GetMaterialApp(
      home: MainPage()
    );
  }
}
