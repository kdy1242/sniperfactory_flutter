
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);
  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: controller.idController,
              decoration: InputDecoration(
                labelText: 'ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: controller.pwController,
              decoration: InputDecoration(
                labelText: 'PW',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.login,
                child: Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

