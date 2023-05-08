
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/user.dart';
import '../util/app_routes.dart';
import '../util/api_routes.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  final RxString _token = RxString('');
  Dio dio = Dio();

  User? get user => _user.value;
  String get token => _token.value;

  login(String id, String pw) async {
    dio.options.baseUrl = ApiRoutes.baseUrl;

    try {
      var res = await dio.post(
        'http://52.79.115.43:8090${ApiRoutes.authWithPassword}',
        data: {'identity': id, 'password': pw}
      );
      if (res.statusCode == 200) {
        var user = User.fromMap(res.data['record']);
        var token = res.data['token'];
        _user(user);
        _token(token);
      }
    } on DioError catch(e) {
      print(e.message);
    }
  }

  logout() {
    _user(null);
  }

  _handleAuthChanged(User? data) {
    if (data != null) {
      Get.toNamed(AppRoutes.main);
      return;
    }
    Get.toNamed(AppRoutes.login);
    return;
  }

  @override
  void onInit() {
    super.onInit();
    ever(_user, _handleAuthChanged);
  }
}
