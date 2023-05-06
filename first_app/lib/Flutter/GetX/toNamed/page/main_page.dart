
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/routes.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('main_page'),
            TextButton(
              child: const Text('로그인으로 이동'),
              onPressed: (){
                Get.toNamed(AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
