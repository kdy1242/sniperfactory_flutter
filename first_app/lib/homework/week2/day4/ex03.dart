// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Feel {
  String feel;
  Color startColor;
  Color endColor;
  Feel(this.feel, this.startColor, this.endColor);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    List<Feel> feels = [
      Feel('우울함', Colors.black, Colors.white), 
      Feel('행복함', Colors.orange, Colors.yellow), 
      Feel('상쾌함', Colors.blue, Colors.green)
    ];
    
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('오늘의 하루는', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Text('어땠나요?', style: TextStyle(fontSize: 20),),
                SizedBox(
                  width: 300,
                  height: 200,
                  child: PageView.builder(
                    itemCount: feels.length,
                    itemBuilder: (context, index) { 
                      return Container(
                        width: 300,
                        height: 300,
                        margin: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              feels[index].startColor,
                              feels[index].endColor,
                            ]
                          ),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text(feels[index].feel, style: TextStyle(color: Colors.white, fontSize: 20),),
                      );
                    },
                  ),
                ),
              ],
            )
          ),
        ),
      )
    );
  }
}
