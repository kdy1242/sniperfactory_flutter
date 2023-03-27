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
            children: [
              ListTile(
                title: Text('홍길동'),
                subtitle: Text('010-0000-0000'),
                leading: Icon(Icons.person),
                trailing: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.call),
                ),
              ),
              ListTile(
                title: Text('김길동'),
                subtitle: Text('010-1111-1111'),
                leading: Icon(Icons.person),
                trailing: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.call),
                ),
              ),
              ListTile(
                title: Text('박길동'),
                subtitle: Text('010-2222-2222'),
                leading: Icon(Icons.person),
                trailing: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.call),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
