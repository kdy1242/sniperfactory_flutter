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
          child: ListTile(
            title: Text('홍길동'),
            subtitle: Text('010-0000-0000'),
            leading: Icon(Icons.access_time),
            trailing: Icon(Icons.call),
          ),
        ),
      )
    );
  }
}
