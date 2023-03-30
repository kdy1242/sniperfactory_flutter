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
        body: SafeArea (
          child: Column(
            children: [
              Text('Widget: 1'),
              Text('Widget: 2'),
              Text('Widget: 3'),
              Text('Widget: 4'),
              Text('Widget: 5'),
              Text('Widget: 6'),
            ],
          ),
        ),
      )
    );
  }
}