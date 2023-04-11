
import 'package:dio/dio.dart';

void main() async {
  var dio = Dio();
  var url = "https://sniperfactory.com/sfac/http_";

  for(int i=20; i<=50; i++) {
    await dio.get('$url$i')
      .then((res) => print("$res \n $url$i"))    // 요청 성공 시 실행
      .catchError((_) {});    // 요청 실패 시 실행
  }
}
