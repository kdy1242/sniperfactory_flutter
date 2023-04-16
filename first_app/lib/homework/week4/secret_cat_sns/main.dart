
import 'package:flutter/material.dart';
import 'secret_cat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'neo'),
      home: SecretCatPage()
    );
  }
}

