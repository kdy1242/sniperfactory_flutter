
import '../controller/global_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<GlobalDataController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(controller.myLevel.value.toString())),
            ElevatedButton(
              onPressed: () {
                controller.myLevel(controller.myLevel.value += 1);
              },
              child: Text('+1'),
            )
          ],
        ),
      ),
    );
  }
}
