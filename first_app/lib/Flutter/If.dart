// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var myController = TextEditingController();
    bool trueFalse = false;

    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: myController,
            ),
            TextButton(
              onPressed: () {
                if(int.parse(myController.text) > 10) {
                  print('돈 보내기');
                } else {
                  print('돈은 10원 이상부터 보낼 수 있습니다.');
                }
                // true일때 실행할 코드가 한 줄이면 중괄호 안 쳐도 됨
                // if(int.parse(myController.text)>10) print('돈보내기');
              },
              child: Text('돈 보내기')
            ),
            if(trueFalse) Text('TRUE')
            else Text('FASLE'),
            // 삼항연산자
            trueFalse ? Text('TRUE') : Text('False'),
          ],
        ),
      ),
    );
  }
}
