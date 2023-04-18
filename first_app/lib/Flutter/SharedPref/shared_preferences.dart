
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _counter = 0;
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    initPreferences();
  }

  // 초기화
  void initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      _counter = prefs!.getInt('counter') ?? 0;
      setState(() {});
    }
  }


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
        body: Center(
          child: Text('$_counter', style: TextStyle(fontSize: 48),),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _counter ++;
            });
            print(_counter);
            print(prefs);
            if (prefs != null) {
              prefs!.setInt('counter', _counter);

            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}