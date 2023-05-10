
import 'package:dio/dio.dart';

import 'api_routes.dart';

class CustomDio {
  static CustomDio? _instance;
  late Dio _dio;

  factory CustomDio() {
    _instance ??= CustomDio._(); // 인스턴스가 없는 경우에만 생성
    return _instance!;
  }

  CustomDio._() {
    _dio = Dio(); // Dio 객체 초기화
    // 추가적인 설정을 할 수 있습니다.
    dio.options.baseUrl = ApiRoutes.baseUrl;
  }

  Dio get dio => _dio!;
}
