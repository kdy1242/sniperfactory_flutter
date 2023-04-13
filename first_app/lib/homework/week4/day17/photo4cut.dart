
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'photoItem.dart';

class Photo4cut extends StatefulWidget {
  const Photo4cut({Key? key}) : super(key: key);

  @override
  State<Photo4cut> createState() => _Photo4cutState();
}

class _Photo4cutState extends State<Photo4cut> {
  // 이미지가 담길 변수를 null로 미리 초기화해두기
  List<XFile?> selectedImageList = List<XFile?>.filled(4, null);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text('포토네컷'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(4, (index) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: PhotoItem(
                  selectedImage: selectedImageList[index],
                  // 이미지 선택 시 selectedImageList 업데이트
                  onImageSelected: (XFile? image) {
                    setState(() {
                      selectedImageList[index] = image;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
