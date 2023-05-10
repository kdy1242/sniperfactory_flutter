
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/api_routes.dart';
import 'auth_controller.dart';

class UploadController extends GetxController {
  TextEditingController secretController = TextEditingController();
  Dio dio = Dio();
  RxBool showName = false.obs;

  RxString hamText = '진짜\n나만 알고\n잇을게'.obs;

  var user = Get.find<AuthController>().user;

  upload() async {
    dio.options.baseUrl = ApiRoutes.baseUrl;
    if (secretController.text == '') return;

    try {
      var res = await dio.post(
        ApiRoutes.uploadSecret,
        data: {
          'secret': secretController.text,
          'author': user!.id,
          'authorName': showName.value ? user!.username : '',
        }
      );
      if (res.statusCode == 200) {
        Get.snackbar('비밀 등록 성공!', '야호');
        hamText('헤헤\n뻥이지롱');
        Future.delayed(Duration(seconds: 3), () {
          hamText('진짜\n나만 알고\n잇을게');
        });
      }
    } on DioError catch(e) {
      Get.snackbar('비밀 등록 실패', 'ㅠㅠ');
      print(e.message);
    }
  }
}
