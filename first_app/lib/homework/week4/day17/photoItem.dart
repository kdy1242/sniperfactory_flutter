
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({Key? key, required this.onImageSelected, this.selectedImage,}) : super(key: key);

  // 이미지 선택 시 호출할 함수
  final Function(XFile?) onImageSelected;
  final XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var image = await ImagePicker().pickImage(source: ImageSource.gallery);
        onImageSelected(image);
      },
      onDoubleTap: () {
        onImageSelected(null);
      },
      child: Container(
        width: 300,
        height: 150,
        color: Colors.grey[900],
        child: selectedImage == null
            ? null
            : Image.file(File(selectedImage!.path), fit: BoxFit.cover),
      ),
    );
  }
}

