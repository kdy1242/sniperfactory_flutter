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
          child: SizedBox(
            width: 300,
            height: 300,
            child: Center(
              child: Text('안녕하세요'),
            ),
          ),
        ),
      )
    );
  }
}
