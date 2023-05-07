
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../util/api_route.dart';
import '../model/user.dart';
import '../view/login_page.dart';
import '../view/main_page.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  Dio dio = Dio();

  User? get user => _user.value;
  
  login(String id, String pw) async {
    try {
      var res = await dio.post(
          'http://52.79.115.43:8090${ApiRoutes.authWithPassword}',
          data: {'identity': id, 'password': pw}
      );
      if (res.statusCode == 200) {
        // print(res.data());
        var user = User.fromMap(res.data['record']);
        _user(user);
      }
    } on DioError catch(e) {
      print(e.message);
      print(e.requestOptions.path);
    }
  }

  logout() {
    _user.value = null;
  }

  _handleAuthChanged (User? data) {
    if (data != null) {
      Get.toNamed(MainPage.route);
      return;
    }
    Get.toNamed(LoginPage.route);
    return;
  }

  @override
  void onInit() {
    super.onInit();
    ever(_user, _handleAuthChanged);
  }
}
