
import 'package:http/http.dart' as http;


void main()  {
  print("HTTP 테스트하기");

  // test();
  // get();
  post();
}

void test() async {
  var url = 'https://sniperfactory.com/sfac/http_test';
  var response = await http.get(Uri.parse(url)); // string 형태의 url을 Uri로 바꿈
  print(response.statusCode); // 200 : 요청 성공
  print(response.body); // {"result":"스나이퍼팩토리 비밀 URL에 접근하시다니."}
}

void get() async {
  var url = 'https://sniperfactory.com/sfac/http_only_get';

  var getResponse = await http.get(Uri.parse(url));
  print(getResponse.body);  // {"result":"정답입니다! GET 요청만 받는 경우도 정말정말 많습니다."}

  var postResponse = await http.post(Uri.parse(url));
  print(postResponse.body);  // {"error":"GET 요청만 받습니다."}
}

void post() async {
  var url = 'https://sniperfactory.com/sfac/http_only_post';

  var postResponse = await http.post(Uri.parse(url));
  print(postResponse.body);  // {"result":"정답입니다! POST 요청만 받는 경우도 정말정말 많습니다."}

  var getResponse = await http.get(Uri.parse(url));
  print(getResponse.body);  // {"error":"POST 요청만 받습니다."}
}
