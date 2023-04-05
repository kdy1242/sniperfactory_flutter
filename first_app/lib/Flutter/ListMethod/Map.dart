// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var categories = ['식품', '생활', '디지털', '뷰티', '패션', '자동차', '할인'];

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: categories.map((e) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Chip(label: Text(e)),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}