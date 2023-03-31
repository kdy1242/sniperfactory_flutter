// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String message = '안녕';
  int level = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     message = '반갑';
        //     setState(() {});
        //   },
        //   child: Icon(Icons.change_circle),
        // ),
        body: InkWell(
          onTap: () {
            level ++;
            setState(() {});
          },
          child: Center(
            child: Text('현재 $level레벨 입니다'),
          ),
        ),
      )
    );
  }
}
