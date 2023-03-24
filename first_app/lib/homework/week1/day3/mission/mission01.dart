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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text('A'),
                Text('B'),
                Icon(Icons.add),
                Text('C'),
                Icon(Icons.home),
                Text('D'),
              ]
            ),
          ),
        ),
      )
    );
  }
}
