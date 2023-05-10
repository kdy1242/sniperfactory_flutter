
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/burgers.dart';
import '../../util/app_routes.dart';
import '../../controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);
  static const String route = '/login';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: 150, height: 150, child: Image.asset(Burgers.mainHam)),
                SizedBox(height: 50),
                TextField(
                  controller: controller.idController,
                  decoration: InputDecoration(
                    labelText: '아이디',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: controller.pwController,
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(
                  children: [
                    Obx(() => Checkbox(
                      value: controller.saveToken.value,
                      onChanged: (value) {
                        controller.saveToken(value!);
                      }
                    )),
                    Text('로그인 정보 저장'),
                  ],
                ),
                SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.login,
                    child: Text('로그인'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.signUp);
                  },
                  child: Text('회원가입')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
