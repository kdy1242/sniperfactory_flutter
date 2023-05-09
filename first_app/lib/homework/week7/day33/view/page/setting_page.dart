
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../widget/burgers.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);
  static const String route = '/setting';

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(controller.user!.username.substring(0, 1)),
                  ),
                  title: Text(controller.user!.username),
                  subtitle: Text(controller.user!.email),
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('로그아웃하기'),
                onTap: controller.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

