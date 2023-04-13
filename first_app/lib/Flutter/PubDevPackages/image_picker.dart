
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    var imagePicker = ImagePicker();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(selectedImage != null) Image.file(File(selectedImage!.path)),
              TextButton(
                onPressed: () async {
                  var image = await imagePicker.pickImage(source: ImageSource.gallery);
                  if(image != null) {
                    print('이미지를 선택햇군');
                    selectedImage = image;
                    setState(() {});
                  } else {
                    print('선택하라고햇지');
                  }
                },
                child: Text('이미지 선택하세요'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
