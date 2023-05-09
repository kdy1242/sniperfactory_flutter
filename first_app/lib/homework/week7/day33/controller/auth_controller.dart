
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
        ApiRoutes.authWithPassword,
        data: {'identity': id, 'password': pw}
      );
      if (res.statusCode == 200) {
        var user = User.fromMap(res.data['record']);
        var token = res.data['token'];
        _user(user);
        _token(token);
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

  _handleAuthChanged(User? data) {
    if (data != null) {
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
