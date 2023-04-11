
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
  var data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var dio = Dio();
    var res = await dio.get('https://jsonplaceholder.typicode.com/photos?albumId=1');
    setState(() {
      data = res.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: data.length,
            itemBuilder: (context, index) =>
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(data[index]['url']),
                    Text(data[index]['title'])
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        spreadRadius: 1,
                      )
                    ]
                ),
                clipBehavior: Clip.antiAlias,
              ),
            )
        ),
      ),
    );
  }
}
