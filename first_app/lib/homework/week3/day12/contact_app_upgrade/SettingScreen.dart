// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(title: Text('차단 목록')),
          ListTile(title: Text('벨소리 설정')),
          ListTile(title: Text('전화 통계')),
        ],
      ),
    );
  }
}
