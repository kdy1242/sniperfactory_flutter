
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('플러터 굉장하군'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          centerTitle: false,
        ),
        body: Column(
          children: [
            Text(DateFormat('y/M/d').format(DateTime(2009, 9, 3))),
            Text(NumberFormat.currency(locale: 'ko_KR', symbol: '원').format(4000000))
          ],
        ),
      ),
    );
  }
}
