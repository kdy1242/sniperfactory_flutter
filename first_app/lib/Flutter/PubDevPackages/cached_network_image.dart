
import 'package:cached_network_image/cached_network_image.dart';
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
            CachedNetworkImage(imageUrl: 'https://picsum.photos/100/100',),
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider('https://picsum.photos/100/100',),
            )
          ],
        ),
      ),
    );
  }
}
