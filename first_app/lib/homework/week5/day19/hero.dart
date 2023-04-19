
import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  const HeroPage({Key? key, required this.imgUrl, required this.heroTag}) : super(key: key);

  final String imgUrl;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second page'),
        centerTitle: false,
        elevation: 0,
      ),
      body: Center(
        child: Hero(
          tag: heroTag,
          child: Image.network(imgUrl)
        ),
      ),
    );
  }
}
