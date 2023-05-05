
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controller/coin_controller.dart';
import 'shop_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<CoinController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Current coin : ${controller.coin}', style: TextStyle(fontSize: 18))),
            Icon(
              FontAwesomeIcons.bitcoin,
              size: 96.0,
              color: Colors.yellow.shade700,
            ),
            TextButton(
              onPressed: (){
                Get.to(() => ShopPage());
              },
              child: Text('상점으로 이동하기'),
            ),
          ],
        ),
      ),
    );
  }
}
