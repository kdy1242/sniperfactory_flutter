
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/coin_controller.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<CoinController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('상점', style: TextStyle(fontSize: 18)),
            Obx(() => Text('현재 보유한 코인 : ${controller.coin}')),
            TextButton(
              onPressed: (){
                controller.coin.value = 0;
              },
              child: Text('코인 리셋'),
            ),
          ],
        ),
      ),
    );
  }
}
