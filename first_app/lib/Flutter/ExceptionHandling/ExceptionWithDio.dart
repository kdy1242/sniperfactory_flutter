
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
  Dio dio = Dio();
  String result = '';

  void getData() async {
    result = '';
    setState(() {});
    try {
      var url = 'https://sniperfactory.com/sfac/http_randomly';
      var res = await dio.get(url);
      result = res.data['item']['name'];
    } on DioError catch (e) {
      print('에러가 낫다니');
      result = e.message!;
    } finally {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(result),
              TextButton(
                onPressed: (){
                  getData();
                },
                child: Text('메세지 가져오기')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
