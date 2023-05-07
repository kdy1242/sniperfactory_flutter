
import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../controller/main_controller.dart';
import 'package:flutter/material.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    var user = Get.find<AuthController>().user!;

    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${user.username} 님 안녕하세요', style: TextStyle(fontSize: 30)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                  ),
                  title: Text(user.username),
                  subtitle: Text(user.name),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('로그아웃하기'),
                  onTap: controller.logout,
                ),
              ],
            ),
          ]
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.curPage.value,
          onTap: controller.onPageTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
          ],
        ),
      ),
    );
  }
}

