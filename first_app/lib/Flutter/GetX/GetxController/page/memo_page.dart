
import 'package:first_app/Flutter/GetX/GetxController/controller/app_global_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemoPage extends StatelessWidget {
  const MemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: Get.find<AppGlobalDataController>().memos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(Get.find<AppGlobalDataController>().memos[index]),
            );
          },
        ),
      ),
    );
  }
}
