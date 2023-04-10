
import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_app/homework/week4/day14/images.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Carousel(),
    );
  }
}

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('14일차 과제 4'),
      ),
      body: Center(
        child: CarouselSlider(
          items: imageUrl.map((url) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            // 자동 슬라이드
            autoPlay: true,
          ),
        ),
      ),
    );
  }
}
