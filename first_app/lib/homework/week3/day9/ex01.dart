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
      home: AnimalList(),
    );
  }
}

class AnimalList extends StatefulWidget {
  const AnimalList({Key? key}) : super(key: key);

  @override
  State<AnimalList> createState() => _AnimalListState();
}

class _AnimalListState extends State<AnimalList> {
  @override
  Widget build(BuildContext context) {
    List animalList = ['강아지', '고양이', '앵무새', '토끼', '오리', '거위', '원숭이'];
    ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('9일차 과제'),
      ),
      body: ListView.builder(
        controller: scrollController,
        itemCount: animalList.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 300,
            child: Center(child: Text(animalList[index])),
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.linear);
        },
        child: Icon(Icons.vertical_align_top),
      ),
    );
  }
}
