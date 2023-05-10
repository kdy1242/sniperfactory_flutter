
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/upload_controller.dart';

class UploadPage extends GetView<UploadController> {
  const UploadPage({Key? key}) : super(key: key);
  static const String route = '/upload';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                child: Stack(
                  children: [
                    Image.asset('assets/images/secret_hamburger/UploadPage-burger.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 120.0, top: 20),
                      child: Align(
                        child: Obx(() => Text('${controller.hamText}'))
                      ),
                    )
                  ]
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: controller.secretController,
                  maxLines: null,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    hintText: '비밀을 말해보렴!!!',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.upload,
                  child: Text('비밀 등록'),
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
