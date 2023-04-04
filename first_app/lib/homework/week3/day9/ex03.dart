// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:first_app/homework/week3/day9/ex01.dart';
import 'package:first_app/homework/week3/day9/ex02.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Ex03Navigation(),
    );
  }
}

class Ex03Navigation extends StatelessWidget {
  const Ex03Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('9일차 과제'),
      ),

      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AnimalList())
                  );
                },
                child: Text('1번 과제')
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TextMirroring()));
                },
                child: Text('2번 과제')
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
