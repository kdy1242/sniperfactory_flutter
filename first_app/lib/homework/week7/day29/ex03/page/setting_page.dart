
import 'package:first_app/homework/week7/day29/ex03/controller/app_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  var controller = Get.find<AppSettingController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('setting'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: controller.isSoundOn,
                onChanged: (value) {
                  setState(() {
                    controller.isSoundOn = value!;
                  });
                  controller.lastUpdated = DateTime.now();
                },
              ),
              Text('Sound', style: TextStyle(fontSize: 20)),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: controller.isNotificationOn,
                onChanged: (value) {
                  setState(() {
                    controller.isNotificationOn = value!;
                  });
                  controller.lastUpdated = DateTime.now();
                },
              ),
              Text('Notification', style: TextStyle(fontSize: 20)),
            ],
          ),
        ],
      ),
    );
  }
}
