
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
            ListTile(
              title: Text('1번 타일'),
            ),
            Divider(
              height: 48,   // 상하 여백
              thickness: 2, // 굵기
              indent: 24,   // 왼쪽 padding
              endIndent: 24,   // 왼쪽 padding
              color: Colors.red,  // 색
            ),
            ListTile(
              title: Text('1번 타일'),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Text(index.toString());
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            )
          ],
        ),
      )
    );
  }
}
