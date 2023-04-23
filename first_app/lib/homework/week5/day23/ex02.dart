
import 'package:dio/dio.dart';
import 'package:first_app/homework/week5/day23/Course.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var dio = Dio();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: dio.get('https://sniperfactory.com/sfac/http_json_data'),
            builder: (context, snapshot) {
              Course course = Course.fromMap(snapshot.data!.data['item']);
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  width: 250,
                  height: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.network(course.image,
                          fit: BoxFit.fill,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(course.name),
                            Divider(),
                            Text(course.description),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: ElevatedButton(
                                onPressed: (){},
                                child: Text('${course.price}원 결제하고 등록'),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity, 35)
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          spreadRadius: 1,
                        )
                      ]
                  ),
                  clipBehavior: Clip.antiAlias,
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          )
        ),
      ),
    );
  }
}
