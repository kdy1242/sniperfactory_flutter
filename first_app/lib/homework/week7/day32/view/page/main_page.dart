
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/main_controller.dart';
import '../screen/my_screen.dart';
import '../screen/home_screen.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {

    List<Widget> screens = [
      HomeScreen(user: controller.user, documents: controller.documents),
      MyScreen(user: controller.user, onTap: controller.logout),
    ];

    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: controller.pageController,
          itemCount: screens.length,
          itemBuilder: (context, index) {
            return screens[index];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.readDocuments,
        child: Icon(Icons.restart_alt),
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
