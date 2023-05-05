
import 'package:first_app/homework/week7/day29/ex03/controller/app_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var info = Get.find<AppSettingController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('info'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('sound: ${info.isSoundOn ? 'on' : 'off'}', style: TextStyle(fontSize: 20)),
          Text('notification: ${info.isNotificationOn ? 'on' : 'off'}', style: TextStyle(fontSize: 20)),
          Text('app version: ${info.appVersion}', style: TextStyle(fontSize: 20)),
          Text('app name: ${info.appName}', style: TextStyle(fontSize: 20)),
          Text('app author: ${info.appAuthor}', style: TextStyle(fontSize: 20)),
          Text('app package name: ${info.appPackageName}', style: TextStyle(fontSize: 20)),
          Text('last updated: ${info.lastUpdated != null ? info.lastUpdated : '변경 없음'}', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
