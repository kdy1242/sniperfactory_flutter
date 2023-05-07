
import '../controller/app_global_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'memo_page.dart';
import 'user_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppGlobalDataController(age: 99, name: 'Teddy', memos: []), tag: 'my controller');

    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${controller.name}님 / ${controller.age}살'),
              TextButton(
                onPressed: (){
                  Get.to(() => MemoPage());
                },
                child: Text('To MemoPage'),
              ),
              TextButton(
                onPressed: (){
                  Get.to(() => UserPage());
                },
                child: Text('To UserPage'),
              ),
              TextButton(
                onPressed: (){
                  controller.memos.add('새로운 메모가 들어갑니다');
                },
                child: Text('Add memo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
