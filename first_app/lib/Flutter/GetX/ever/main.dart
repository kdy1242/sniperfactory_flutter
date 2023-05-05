
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/global_data_controller.dart';
import 'model/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(GlobalDataController());

    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: (){
              print(controller.user);
              controller.user(User(id: 'asdf', nickname: 'asd'));
            },
            child: Text('로그인'),
          ),
        ),
      )
    );
  }
}
