
import 'package:first_app/Flutter/GetX/Controller/GetxController/controller/app_global_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AppGlobalDataController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.name),
            Text('${controller.age}'),
            Text('현재 메모 수 : ${controller.memos.length}'),
          ],
        ),
      )
    );
  }
}
