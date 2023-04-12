
import 'package:dio/dio.dart';

void main() async {
  var dio = Dio();
  var url = 'https://sniperfactory.com/sfac/http_randomly_null';
  String? result = '';

  var res = await dio.get(url);
  print(res.data);

  var item = res.data['item'];
  result = item['name'] ?? 'null임';  // 35% 확률로 null

  print(result);
}
