// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('플러터 굉장하다'),     // 이름 적기
          backgroundColor: Colors.red,     // 색상 넣기
          foregroundColor: Colors.black,   // foreground 색상 넣기
          centerTitle: false,              // 가운데 정렬 풀기
          // backgroundColor: Colors.transparent  // 배경색 없애기
          elevation: 0,                     // 그림자 없애기
          leading: Icon(Icons.access_time), // 제일 앞에 아이콘 넣기
          actions: [                        // 제일 뒤에 아이콘 넣기
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.share),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ],
        ),
        body: Text('Flutter is the best!'),
      )
    );
  }
}
