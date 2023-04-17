
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double currentOpacity = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('플러터 굉장하다'),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                spacing: 10,  // 각 요소별 간격
                runSpacing: 10, // 줄 간격
                children: [
                  Container(
                    color: Colors.red,
                    width: 90,
                    height: 40,
                  ),
                  Container(
                    color: Colors.orange,
                    width: 90,
                    height: 40,
                  ),
                  Container(
                    color: Colors.yellow,
                    width: 90,
                    height: 40,
                  ),
                  Container(
                    color: Colors.green,
                    width: 90,
                    height: 40,
                  ),
                  Container(
                    color: Colors.blue,
                    width: 90,
                    height: 40,
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}
