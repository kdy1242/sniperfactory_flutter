// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 0.8);
    List pages = [
      Container(color: Colors.red),
      Container(color: Colors.orange),
      Container(color: Colors.yellow),
    ];

    return MaterialApp(
      home: Scaffold(
        body: PageView.builder(
          controller: pageController,
          itemCount: pages.length,
          itemBuilder: (BuildContext context, int index) {
            return pages[index];
          },
        ),
      )
    );
  }
}
