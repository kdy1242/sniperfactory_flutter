
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/secret.dart';
import '../util/api_routes.dart';

class SecretController extends GetxController {
  RxList<Secret> secrets = RxList();
  Dio dio = Dio();

  readSecrets() async {
    dio.options.baseUrl = ApiRoutes.baseUrl;

    try {
      var res = await dio.get(ApiRoutes.readSecret);
      if (res.statusCode == 200) {
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(res.data['items']);
        secrets(data.map((e) => Secret.fromMap(e)).toList().obs);
      }
    } on DioError catch(e) {
      print(e.message);
    }
  }

  @override
  void onInit() {
    super.onInit();
    readSecrets();
  }
}
