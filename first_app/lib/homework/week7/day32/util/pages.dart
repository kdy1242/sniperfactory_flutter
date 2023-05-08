
import 'package:get/get.dart';

import '../view/page/main_page.dart';
import '../view/page/login_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: MainPage.route, page: () => const MainPage()),
    GetPage(name: LoginPage.route, page: () => const LoginPage()),
  ];
}
