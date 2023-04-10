
import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Badge(
                    // Badge 안에 표시할 위젯
                    badgeContent: Text('A'),
                    // Badge 위치
                    position: BadgePosition.topEnd(),
                    child: Text(
                      nouns[index],
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                    )
                  ),
                  TextButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: nouns[index],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                      );
                    },
                    child: Text('버튼')
                  ),
                ],
              )
            )
          ),
        ),
      ),
    );
  }
}