
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/user.dart';
import '../model/document.dart';
import '../util/api_routes.dart';
import 'auth_controller.dart';

class MainController extends GetxController {
  var pageController = PageController();
  var _user = Get.find<AuthController>().user!;
  RxInt curPage = 0.obs;
  RxList<Document> documents = RxList();

  RxList list = [].obs;
  Dio dio = Dio();

  User get user => _user;

  readDocuments() async {
    documents([]);
    dio.options.baseUrl = ApiRoutes.baseUrl;
    var token = Get.find<AuthController>().token;

    try {
      var res = await dio.get(
        ApiRoutes.documents,
        options: Options(headers: {'Authorization': token}),
      );
      if (res.statusCode == 200) {
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(res.data['items']);
        documents(data.map((e) => Document.fromMap(e)).toList().obs);
      }
    } on DioError catch(e) {
      print(e.message);
    }
  }

  onPageTapped(int v) {
    pageController.jumpToPage(v);
    curPage(v);
  }

  logout() {
    Get.find<AuthController>().logout;
  }
}
