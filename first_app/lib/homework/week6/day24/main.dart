
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'DogImage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    Future<DogImage?> getData() async {
      Dio dio = Dio();
      var res = await dio.get('https://dog.ceo/api/breeds/image/random');

      if (res.statusCode == 200) {
        return DogImage.fromMap(res.data);
      }
      return null;
    }

    return MaterialApp(
      home: Scaffold(
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1,
          ),
          itemBuilder: (context, index) {
            return FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ImageDialog(img: snapshot.data!.message);
                        },
                      );
                    },
                    child: Image.network(
                      snapshot.data!.message,
                      fit: BoxFit.cover,
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }
            );
          }
        ),
      )
    );
  }
}

// dialog
class ImageDialog extends StatelessWidget {
  const ImageDialog({Key? key, required this.img}) : super(key: key);

  final String img;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(img),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close'),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}

