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
        body: SafeArea (
          // child: Column(
          //   children: [
          //     Text('이 아이콘은 더하기 아이콘입니다.'),
          //     Icon(Icons.add),
          //     Text('신기'),
          //   ],
          // ),
          // child: Row(
          //   children: [
          //     Text('더하기 아이콘: '),
          //     Icon(Icons.add),
          //   ],
          // ),
          child: Column(
            children: [
              Row(
                children: [
                  Text('더하기 아이콘: '),
                  Icon(Icons.add),
                ],
              ),
              Row(
                children: [
                  Text('친구들 아이콘: '),
                  Icon(Icons.people),
                ],
              ),
              Row(
                children: [
                  Text('수정 아이콘: '),
                  Icon(Icons.edit),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}