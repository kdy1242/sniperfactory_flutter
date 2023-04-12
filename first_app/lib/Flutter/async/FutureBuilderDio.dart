
import 'package:dio/dio.dart';
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
  var dio = Dio();
  var url = 'https://sniperfactory.com/sfac/http_test';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('sniper factory'),
              FutureBuilder(
                future: Future.delayed(Duration(seconds: 3), () => dio.get('https://sniperfactory.com/sfac/http_test')),
                builder: (context, snapshot) {
                  print(snapshot.connectionState);
                  if (snapshot.connectionState == ConnectionState.done) {
                    // 현재 futureBuilder 의 상태가 끝났을 때
                    return Text(snapshot.data!.data['result']);
                  }
                  return LinearProgressIndicator();
                    //CircularProgressIndicator();
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
