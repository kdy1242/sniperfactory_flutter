
import 'package:dio/dio.dart';

var dio = Dio();

void main() {
  jwtToken();
}

void get() async {
  var getRes = await dio.get('https://sniperfactory.com/sfac/http_only_get');
  // var postRes = await dio.post('https://sniperfactory.com/sfac/http_only_get');

  print(getRes);   // {"result":"정답입니다! POST 요청만 받는 경우도 정말정말 많습니다."}
  // print(postRes);  // 400: Bad Request
}

void post() async {
  var postRes = await dio.post('https://sniperfactory.com/sfac/http_only_post');
  // var getRes = await dio.get('https://sniperfactory.com/sfac/http_only_post');

  print(postRes);    // {"result":"정답입니다! POST 요청만 받는 경우도 정말정말 많습니다."}
  // print(getRes);  // 400: Bad Request
}

void userAgent() async {
  var res = await dio.get(
    'https://sniperfactory.com/sfac/http_only_chrome_browser',
    options: Options(
      headers: {
        'user-agent': 'Chrome'
        // 'user-agent': 'Safari'  // 400: Bad Request
      }
    )
  );
  print(res);   // {"result":"정답입니다! 이런 꿀잼 과제라니"}
}

void jwtToken() async {
  var res = await dio.get(
    'https://sniperfactory.com/sfac/http_only_jwt_included',
    options: Options(
      headers: {
        // 인증키를 첨부할 수 있는 key 값
        'authorization': 'asdfasdf'
      }
    )
  );
  print(res);
}
