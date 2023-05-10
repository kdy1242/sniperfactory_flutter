
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'burgers.dart';
import '../../controller/auth_controller.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 150,
            height: 150,
            child: Image.asset(Burgers.mainHam)
          ),
          Text('정말 로그아웃하실건가요...', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      actions: [
        TextButton(
          child: Text('아닙니다...'),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: Text('네', style: TextStyle(color: Colors.red)),
          onPressed: Get.find<AuthController>().logout,
        ),
      ],
    );
  }
}

