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
        appBar: AppBar(),
        body: DefaultTextStyle(   // 기본 텍스트 스타일
          style: TextStyle(fontSize: 32, color: Colors.black),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text('text button'),
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text('elevated button')
              ),
              OutlinedButton(
                  onPressed: () {},
                  child: Text('outlined button')
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.abc_sharp)
              ),
              InkWell(
                onTap: () {
                  print('야호');
                },
                child: Text('text'),
              ),
              GestureDetector(
                onTap: () {
                  print('야호');
                },
                child: Text('text'),
              ),
            ]
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      )
    );
  }
}
