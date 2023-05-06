
import 'package:get/get.dart';

import '../page/main_page.dart';
import '../page/login_page.dart';
import '../util/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => const LoginPage()),
    GetPage(name: AppRoutes.main, page: () => const MainPage()),
  ];
}
