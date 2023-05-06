
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: DetailPage.route, page: () => const DetailPage())
      ],
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
              Get.toNamed(DetailPage.route, arguments: 'argument', parameters: {'param1': 'param'});
            },
            child: Text('detail_page'),
          ),
        ),
      )
    );
  }
}
