// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List myFriends = ['홍길동', '김길동', '이길동', '박길동', '최길동'];

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView.builder(
            itemCount: myFriends.length,
            itemBuilder: (context, index) {
              return Text(myFriends[index]);
            }
          ),
        ),
      ),
    );
  }
}
