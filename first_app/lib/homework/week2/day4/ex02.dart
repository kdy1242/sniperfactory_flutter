// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class PageColor {
  Color startColor;
  Color endColor;
  PageColor(this.startColor, this.endColor);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    List<PageColor> pageColors = [
      PageColor(Colors.red, Colors.deepOrange), 
      PageColor(Colors.deepOrange, Colors.orange), 
      PageColor(Colors.orange, Colors.yellow),
      PageColor(Colors.yellow, Colors.green),
      PageColor(Colors.green, Colors.blue),
      PageColor(Colors.blue, Colors.indigo),
      PageColor(Colors.indigo, Colors.purple),
    ];
    
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: PageView.builder(
              itemCount: pageColors.length,
              itemBuilder: (context, index) { 
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        pageColors[index].startColor,
                        pageColors[index].endColor,
                      ]
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      )
    );
  }
}
