
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_routes.dart';
import '../widget/burgers.dart';
import 'secret_page.dart';
import 'upload_page.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {

    List menu = ['비밀 보러가기', '비밀 알려주기', '설정'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Image.asset(Burgers.mainHam),
              ),
              Column(
                children: List.generate(
                  menu.length, (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    child: ListTile(
                      leading: Image.asset(Burgers.mainHam),
                      title: Text(menu[index]),
                      onTap: () {
                        switch(index) {
                          case 0:
                            Get.toNamed(AppRoutes.secret);
                            break;
                          case 1:
                            Get.toNamed(AppRoutes.upload);
                            break;
                          case 2:
                            Get.toNamed(AppRoutes.setting);
                            break;
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

