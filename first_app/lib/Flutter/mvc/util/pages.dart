
import 'package:get/get.dart';
import '../controller/login_controller.dart';

import '../view/page/main_page.dart';
import '../view/page/login_page.dart';
import '../util/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      // binding: BindingsBuilder(() {
      //   Get.put(LoginController());
      // })
    ),
    GetPage(name: AppRoutes.main, page: () => const MainPage()),
  ];
}
