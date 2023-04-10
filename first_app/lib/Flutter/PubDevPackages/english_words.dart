// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    nouns.take(50).forEach(print);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('단어 보여주기'),
        ),
        body: ListView.builder(
          itemCount: nouns.length,
          itemBuilder: (context, index) {
            return Text(nouns[index]);
          }
        ),
      ),
    );
  }
}
