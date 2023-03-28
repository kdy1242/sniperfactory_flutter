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
        body: SafeArea(
          child: Center(

          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: '친구'),
            BottomNavigationBarItem(icon: Icon(Icons.video_camera_front), label: 'Watch'),
            BottomNavigationBarItem(icon: Icon(Icons.security), label: '프로필'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: '알림'),
            BottomNavigationBarItem(icon: CircleAvatar(backgroundImage:NetworkImage('https://picsum.photos/50/50')), label: '메뉴'),
          ],
        ),
      )
    );
  }
}
