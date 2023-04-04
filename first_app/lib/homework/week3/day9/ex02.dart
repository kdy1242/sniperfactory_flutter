// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextMirroring(),
    );
  }
}

class TextMirroring extends StatefulWidget {
  const TextMirroring({Key? key}) : super(key: key);

  @override
  State<TextMirroring> createState() => _TextMirroringState();
}

class _TextMirroringState extends State<TextMirroring> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('2번 문제'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            onChanged: (text) {
              setState(() {});
            },
            controller: textController,
          ),
          Text(textController.text),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            textController.text = '';
          });
        },
        child: Icon(Icons.close),
      ),
    );
  }
}

