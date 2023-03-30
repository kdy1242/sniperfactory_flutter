// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void _handleOnChanged(String value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: TextField(
          cursorColor: Colors.green,
          decoration: InputDecoration(
            label: Text('이메일 입력'),  // Label 추가
            labelStyle: TextStyle(color: Colors.green),
            hintText: 'example@email.com',  // 입력 전 힌트 보여주기(텍스트 입력하면 사라짐)
            fillColor: Colors.black12,  // 배경 색
            filled: true, // TextField는 원래 투명하기 때문에 fillColor만 설정해주면 색상이 적용되지 않음. 같이 설정해주기
          ),
          // onChanged: (value) {
          //   print(value);
          // },
          onChanged: _handleOnChanged,
        )
      )
    );
  }
}
