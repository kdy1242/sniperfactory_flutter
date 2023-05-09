
import 'package:get/get.dart';

import '../view/page/main_page.dart';
import '../view/page/login_page.dart';
import '../view/page/secret_page.dart';
import '../view/page/upload_page.dart';
import '../view/page/sign_up_page.dart';
import '../view/page/setting_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: MainPage.route, page: () => const MainPage()),
    GetPage(name: LoginPage.route, page: () => const LoginPage()),
    GetPage(name: SecretPage.route, page: () => const SecretPage()),
    GetPage(name: UploadPage.route, page: () => const UploadPage()),
    GetPage(name: SignUpPage.route, page: () => const SignUpPage()),
    GetPage(name: SettingPage.route, page: () => const SettingPage()),
  ];
}
