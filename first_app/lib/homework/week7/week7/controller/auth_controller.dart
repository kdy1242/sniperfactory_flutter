
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';
import '../util/app_routes.dart';
import '../util/api_routes.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  String? _token;
  Dio dio = Dio();

  User? get user => _user.value;

  login(String id, String pw, bool saveToken) async {
    dio.options.baseUrl = ApiRoutes.baseUrl;

    try {
      var res = await dio.post(
        ApiRoutes.authWithPassword,
        data: {'identity': id, 'password': pw}
      );
      if (res.statusCode == 200) {
        var user = User.fromMap(res.data['record']);
        _user(user);

        if (saveToken) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          _token = res.data['token'];
          prefs.setString('token', _token!);
        }
      }
    } on DioError catch(e) {
      Get.snackbar('로그인 실패!', '아이디와 비밀번호를 다시 확인해보게...');
      print(e.message);
    }
  }

  signUp(String email, String password, String passwordConfirm, String username) async {
    dio.options.baseUrl = ApiRoutes.baseUrl;

    try {
      await dio.post(
        ApiRoutes.signUp,
        data: {
          'email': email,
          'password': password,
          'passwordConfirm': passwordConfirm,
          'username': username,
        }
      );
      Get.snackbar('회원가입 성공~', '환영합니다');
      Get.back();
    } on DioError catch(e) {
      print(e.message);
      Get.snackbar('회원가입 실패', '환영할뻔');
    }
  }

  logout() {
    _user.value = null;
  }

  autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    if (_token != null) {
      try {
        var res = await dio.post(
          ApiRoutes.autoLogin,
          options: Options(headers: {"Authorization": 'Bearer $_token'}),
        );
        if (res.statusCode == 200) {
          var user = User.fromMap(res.data['record']);
          _user(user);
          return;
        }
      } on DioError catch(e) {
        print('auto login : ${e.message}');
      }
    }
    Get.offNamed(AppRoutes.login);
  }

  _handleAuthChanged(User? userData) {
    if (userData != null) {
      Get.offNamed(AppRoutes.main);
      return;
    }
    Get.offAllNamed(AppRoutes.login);
    return;
  }

  @override
  void onInit() {
    super.onInit();
    ever(_user, _handleAuthChanged);
  }
}
