
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
    var res = await dio.get('https://sniperfactory.com/sfac/http_json_data');
    setState(() {
      data = res.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 250,
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(data['item']['image'],
                    fit: BoxFit.fill,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['item']['name'],),
                      Divider(),
                      Text(data['item']['description'],),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: (){},
                    child: Text('${data['item']['price']}원 결제하고 등록'))
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  spreadRadius: 1,
                )
              ]
            ),
            clipBehavior: Clip.antiAlias,
          )
        ),
      ),
    );
  }
}
