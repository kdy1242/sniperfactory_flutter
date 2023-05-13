
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
              Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: controller.user!.photoURL != null
                        ? NetworkImage(controller.user!.photoURL!)
                        : null,
                  ),
                  Expanded(
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('혈액형: ${controller.profile?.bloodtype ?? 'null'}'),
                          Text('직업: ${controller.profile?.job ?? 'null'}'),
                          Text('mbti: ${controller.profile?.mbti ?? 'null'}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ...controller.images.map((e) => Image.network(e)).toList(),
              TextButton(
                onPressed: () async {
                  var picker = ImagePicker();
                  var res = await picker.pickImage(source: ImageSource.gallery);
                  if (res != null) {
                    controller.uploadImage(res);
                  }
                },
                child: Text('업로드')
              )
            ],
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('edit/profile'),
        child: Icon(Icons.edit),
      ),
    );
  }
}

