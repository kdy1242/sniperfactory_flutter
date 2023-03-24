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
        backgroundColor: Color.fromARGB(255, 200, 200, 200),
        appBar: AppBar(
          title: Text("1주차 도전하기"),
        ),
        body: ListView(
          
        ),
      )
    );
  }
}
