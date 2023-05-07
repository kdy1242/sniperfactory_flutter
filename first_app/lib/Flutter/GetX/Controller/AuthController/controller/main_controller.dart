
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class MainController extends GetxController {
  var pageController = PageController();
  RxInt curPage = 0.obs;

  onPageTapped(int v) {
    pageController.jumpToPage(v);
    curPage(v);
  }

  logout() {
    Get.find<AuthController>().logout;
  }
}
