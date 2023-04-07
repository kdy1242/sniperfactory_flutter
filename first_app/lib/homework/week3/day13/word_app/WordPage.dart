// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'words.dart';

class WordPage extends StatelessWidget {
  const WordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pageController = PageController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            itemCount: words.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(words[index]['word']!,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  Text(words[index]['meaning']!,
                    style: TextStyle(fontSize: 16, color: Colors.white54, letterSpacing: -1),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(words[index]['example']!, textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white54, letterSpacing: 1),),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.linear);
              },
              child: Icon(Icons.navigate_before),
            ),
            FloatingActionButton(
              onPressed: () {
                pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.linear);
              },
              child: Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),

    );
  }
}