import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 145,
                      height: 145,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.red,
                            Colors.orange
                          ]
                        )
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 130,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        border: Border.all(color: Colors.white, width: 3 ),
                      ),
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ],
                ),
                Text('sniperfactory_official')
              ],
            ),
          ),
        ),
      )
    );
  }
}
