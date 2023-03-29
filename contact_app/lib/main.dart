// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:contact_app/ContactTile.dart';
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
          elevation: 0,
          title: Text('내 연락처'),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert),
            )
          ],
        ),
        body: ListView(
          children: [
            ContactTile(
              name: '이테디',
              phone: '010-1000-2000',
              imgUrl: 'https://picsum.photos/100/100',
            ),
            ContactTile(
              name: '밀리',
              phone: '010-1000-2000',
              imgUrl: 'https://picsum.photos/50/50',
            ),
            ContactTile(
              name: '크리스',
              phone: '010-1000-2000',
              imgUrl: 'https://picsum.photos/75/75',
            ),
            ContactTile(
              name: '주노',
              phone: '010-1000-2000',
              imgUrl: 'https://picsum.photos/60/60',
            ),
            ContactTile(
              name: '해리',
              phone: '010-1000-2000',
              imgUrl: 'https://picsum.photos/80/80',
            ),
            ContactTile(
              name: '벨라',
              phone: '010-1000-2000',
              imgUrl: 'https://picsum.photos/110/110',
            ),
            ContactTile(
              name: '헬렌',
              phone: '010-1000-2000',
              imgUrl: 'https://picsum.photos/150/150',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.contact_phone), label: '연락처'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: '통화기록'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '설정'),
          ],
        ),
      )
    );
  }
}
