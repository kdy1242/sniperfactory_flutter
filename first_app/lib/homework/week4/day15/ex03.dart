
import 'package:dio/dio.dart';

void main() async {
  var dio = Dio();
  var url = "https://sniperfactory.com/sfac/http_assignment_";

  for(int i=100; i<=150; i++) {
    await dio.post(
      '$url$i',
      options: Options(
        headers: {
          'user-agent': 'SniperFactoryBrowser',
          'authorization': 'asdfasdf'
        }
      )
    )
    // 요청 성공 시 실행
    .then((res) => print("$res \n $url$i"))
    // 요청 실패 시 실행
    .catchError((_) {});
  }
}
