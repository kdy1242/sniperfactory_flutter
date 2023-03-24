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
        body: SafeArea(
          child: Container(
            // color: Colors.indigo,
            width: 300,
            height: 300,
            child: Text('안녕하세요'),
            decoration: BoxDecoration(
              color: Colors.indigo,         // 색
              border: Border.all(),           // 테두리
              borderRadius: BorderRadius.circular(24),    // 테두리 둥글게
              gradient: LinearGradient(       // 그라데이션
                begin: Alignment.topLeft,     // 그라데이션 - 시작
                end: Alignment.bottomRight,   // 그라데이션 - 끝
                colors: [                     // 그라데이션 - 색
                  Colors.red,
                  Colors.blue,
                ]
              ),
              boxShadow: [                    // 그림자
                BoxShadow(
                  color: Colors.black12,    // 그림자 색
                  blurRadius: 4,              // 그림자 흐리게
                  spreadRadius: 8,            // 그림자 효과 반경
                  offset: Offset(30, 30),      // 그림자 위치. Offset(x축, y축)
                )
              ]
            ),
          ),
        ),
      )
    );
  }
}



            