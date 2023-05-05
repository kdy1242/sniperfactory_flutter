
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/app_setting_controller.dart';
import 'info_page.dart';
import 'setting_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(AppSettingController(
      isSoundOn: false,
      isNotificationOn: false,
      appVersion: '1.0.0',
      appName: '29일차',
      appAuthor: '공도윤',
      appPackageName: 'aaa',
    ));

    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: (){
                  Get.to(() => SettingPage());
                },
                child: Text('Setting'),
              ),
              TextButton(
                onPressed: (){
                  Get.to(() => InfoPage());
                },
                child: Text('info'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
