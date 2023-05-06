
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      getPages: AppPages.pages,
      home: MainPage(),
    );
  }
}
