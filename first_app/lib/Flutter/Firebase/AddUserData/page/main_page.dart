
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class MainPage extends GetView<AuthController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(controller.user.value!.displayName!),
              Text(controller.profile.value?.bloodtype ?? 'null'),
              Text(controller.profile.value?.job ?? 'null'),
              Text(controller.profile.value?.mbti ?? 'null'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('edit/profile'),
        child: Icon(Icons.edit),
      ),
    );
  }
}

