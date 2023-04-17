
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
          title: Text('플러터 굉장하다'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.red,
                  width: 250,
                  height: 250,
                ),
                Positioned(
                  // 기본적으로 왼쪽 위 배치
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.blue.withOpacity(0.4),  // 투명도
                    width: 200,
                    height: 200,
                  )
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
