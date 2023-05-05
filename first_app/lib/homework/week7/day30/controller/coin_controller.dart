
import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';

class CoinController extends GetxController {
  RxInt coin = RxInt(0);

  CoinController({coin = 0}) : coin = RxInt(coin);  // coin 0으로 초기화

  @override
  void onInit() {
    super.onInit();

    Timer.periodic(Duration(seconds: 1), (timer) {
      coin.value++;
    });

    ever(coin, (value) {
      if (value != 0 && value % 10 == 0) {
        Get.snackbar('코인 $value개 돌파', '축하합니다');
      }
    });
  }
}
