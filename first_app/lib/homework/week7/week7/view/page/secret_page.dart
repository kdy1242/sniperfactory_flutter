
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/secret_controller.dart';
import '../widget/burgers.dart';

class SecretPage extends GetView<SecretController> {
  const SecretPage({Key? key}) : super(key: key);
  static const String route = '/secret';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/secret_hamburger/SecretPage-background.png'),
            fit: BoxFit.fill
          )
        ),
        child: Column(
          children: [
            SizedBox(height: 50),
            Expanded(
              child: Obx(() => PageView.builder(
                controller: controller.pageController,
                  onPageChanged: (int index) {
                    controller.currentPageIndex = index;
                  },
                itemCount: controller.secrets.length,
                itemBuilder: (context, index) {
                  var secret = controller.secrets[index];
                  var author = secret.authorName == '' ? '익명' : secret.authorName;
                  return Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: ZoomIn(child: SizedBox(child: Image.asset(Burgers.mainHam))),
                            title: FadeInLeft(child: Text(author)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ZoomIn(
                              child: Container(
                                width: 200,
                                height: 100,
                                color: Colors.grey[200],
                                child: Text(secret.secret),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              )),
            ),
            Obx(() => Text(
              controller.isPageChanging.value
                  ? controller.pageController.page!.toInt() > controller.currentPageIndex
                    ? '먹을게!!!!!'  // 안뜸
                    : '냠냠'
                  : '짜잔',
              style: TextStyle(fontSize: 20),
            )),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
