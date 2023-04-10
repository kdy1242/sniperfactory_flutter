
import 'package:animate_do/animate_do.dart';
import 'package:english_words/english_words.dart';
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
          title: Text('단어 보여주기'),
        ),
        body: PageView.builder(
          itemCount: nouns.length,
          // 각 페이지를 넘길 때마다 Text가 zoom in 되면서 나타남
          itemBuilder: (context, index) => ZoomIn(
            // 애니메이션 속도
              duration: Duration(milliseconds: 1500),
              child: Center(
                  child: Text(nouns[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),)
              )
          ),
        ),
      ),
    );
  }
}