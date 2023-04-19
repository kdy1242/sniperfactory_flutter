
import 'package:dio/dio.dart';
import 'package:first_app/homework/week5/day19/hero.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('19일차 과제'),
          centerTitle: false,
          elevation: 0,
        ),
        body: FutureBuilder(
          future: dio.get('https://sniperfactory.com/sfac/read_dogs'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!.data['body'];
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: AspectRatio(aspectRatio: 1/1,
                        child: Hero(
                          tag: '$index',
                          child: Image.network(data[index]['url'], fit: BoxFit.cover,)
                        )
                      ),
                      title: Text(data[index]['msg']),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HeroPage(imgUrl: data[index]['url'], heroTag: '$index',)));
                      },
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
