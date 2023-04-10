// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var idController = TextEditingController(text: '');
    var pwController = TextEditingController(text: '');
    return MaterialApp(
        home: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                TextField(
                  controller: idController,
                ),
                TextField(
                  controller: pwController,
                  obscureText: true,
                ),
                TextButton(
                  onPressed: () {
                    print(idController.text);
                    print(pwController.text);
                  },
                  child: Text('로그인'),
                ),

                // TextButton(
                //     onPressed: () {
                //       print(myController.text);
                //     },
                //     child: Text('Hit me'),
                // ),
                // TextButton(
                //   onPressed: () {
                //     myController.text = '';
                //   },
                //   child: Text('Erase'),
                // ),
              ],
            ),
          ),
        )
    );
  }
}
