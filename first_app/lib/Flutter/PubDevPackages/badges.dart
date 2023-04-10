
import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart';
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
          itemBuilder: (context, index) => ZoomIn(
            duration: Duration(milliseconds: 1500),
            child: Center(
              child: Badge(
                // Badge 안에 표시할 위젯
                badgeContent: Text('A'),
                // Badge 위치
                position: BadgePosition.topEnd(),
                child: Text(
                  nouns[index],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                )
              )
            )
          ),
        ),
      ),
    );
  }
}