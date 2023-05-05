
import 'package:first_app/Flutter/GetX/ever/page/main_page.dart';
import 'package:get/get.dart';

import '../model/user.dart';
import '../page/login_page.dart';

class GlobalDataController extends GetxController {
  Rxn<User> user = Rxn();

  @override
  void onInit() {
    super.onInit();
    print('컨트롤러 생성');

    ever(user, (value) {
      if (value == null) {
        Get.to(() => LoginPage());
        return;
      }
      Get.to(() => MainPage());
      return;
    });
  }
}
