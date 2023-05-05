
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/global_data_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<GlobalDataController>();

    return Scaffold(
      body: Center(
        child: Text('main_page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.user.value = null;
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
