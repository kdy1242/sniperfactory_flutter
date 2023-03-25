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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 100,
                color: Colors.blue,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      width: 100,
                      height: 100,
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('라이언', style: TextStyle(color: Colors.white, fontSize: 20)),
                              Text('게임개발', style: TextStyle(color: Colors.white, fontSize: 14)),
                              Text('C#, Unity', style: TextStyle(color: Colors.white, fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.add, color: Colors.white,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
