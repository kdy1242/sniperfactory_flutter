
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
            ListTile(
              title: Text('이테디'),
              trailing: IconButton(
                icon: Icon(Icons.call),
                onPressed: () {
                  launchUrlString('sms:+8210-0000-0000');
                  //launchUrlString('https://sniperfactory.com');
                },
              ),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
