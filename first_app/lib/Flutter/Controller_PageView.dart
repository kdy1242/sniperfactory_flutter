// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pageController = PageController();
    return MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // 다음 페이지로 넘어가는 버튼
              // Duration : 버튼을 누른 후에 다음 페이지까지 도착하는 시간
              // curve : 애니메이션
              pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.linear);
            },
            child: Icon(Icons.navigate_next),
          ),
          body: DefaultTextStyle(
            style: TextStyle(fontSize: 36, color: Colors.black),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PageView(
                  // 스와이프 못하게 금지
                  physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    Text('A페이지'),
                    Text('B페이지'),
                    Text('C페이지'),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
