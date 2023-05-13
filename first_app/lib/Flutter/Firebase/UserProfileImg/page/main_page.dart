
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/auth_controller.dart';
import '../controller/main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Container(
                  width: 150,
                  height: 150,
                  child: CircleAvatar(
                    radius: 36,
                    backgroundImage: controller.user!.photoURL != null
                        ? NetworkImage(controller.user!.photoURL!)
                        : null,
                  ),
                ),
                onTap: controller.handleOnTap,
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(controller.user!.displayName!),
                  Text(controller.user!.email!),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}

