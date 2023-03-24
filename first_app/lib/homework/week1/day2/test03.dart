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
        body: Center(
          child: Container(
            width: 200, height: 200,
            child: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.ac_unit_rounded, size: 100, color: Colors.white, shadows: [Shadow(color: Colors.black, offset: Offset(5, 5))],),
            ),
          ),
        ),
      )
    );
  }
}
