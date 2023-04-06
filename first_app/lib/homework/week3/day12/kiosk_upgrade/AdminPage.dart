// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Admin Page'),
      ),
      body: Column(
        children: [
          ListTile(title: Text('메뉴 추가'),),
          ListTile(title: Text('메뉴 삭제'),),
          ListTile(title: Text('메뉴 수정'),),
        ],
      ),
    );
  }
}
