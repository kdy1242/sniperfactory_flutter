
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: (){
                  Get.dialog(
                    AlertDialog(
                      title: Text('제목'),
                      content: Text('내용'),
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: Text('ㅇㅇ'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Get.dialog'),
              ),
              TextButton(
                onPressed: (){
                  Get.bottomSheet(
                    Container(
                      height: 200,
                      color: Colors.white,
                      child: Center(
                        child: Text('안녕하세요'),
                      ),
                    ),
                  );
                },
                child: Text('Get.bottomSheet'),
              ),
              TextButton(
                onPressed: (){
                  Get.snackbar(
                    '스낵바 제목',
                    '스낵바 메시지',
                    snackPosition: SnackPosition.BOTTOM, // 스낵바 위치 지정
                    duration: Duration(seconds: 3),      // 스낵바 표시 시간 지정
                    mainButton: TextButton(              // 스낵바 버튼 추가
                      onPressed: () {},
                      child: Text('확인'),
                    ),
                  );
                },
                child: Text('Get.snackbar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
