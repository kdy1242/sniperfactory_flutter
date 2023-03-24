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
        backgroundColor: Color.fromARGB(255, 200, 200, 200),
        appBar: AppBar(
          title: Text("1주차 도전하기"),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(13.0),
                    child: Image(
                      image: NetworkImage('https://blog.kakaocdn.net/dn/c2yJ7I/btqwXeUM6jI/a3WrMGPo9vakaDzQWepkOK/img.jpg'),
                      width: 70,
                      height: 70,
                    ),
                  ),
                  Text(
                    "게더",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Icon(Icons.more_horiz, size: 50,)
                ],
              )
            ),
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(13.0),
                    child: Image(
                      image: NetworkImage('https://blog.kakaocdn.net/dn/c2yJ7I/btqwXeUM6jI/a3WrMGPo9vakaDzQWepkOK/img.jpg'),
                      width: 70,
                      height: 70,
                    ),
                  ),
                  Text(
                    "게더",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Icon(Icons.more_horiz, size: 50,)
                ],
              )
            ),
          ],
        ),
      )
    );
  }
}
