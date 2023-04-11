
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

var dio = Dio();
var url = 'https://sniperfactory.com/sfac/http_json_data';

void main() {
  getDataUsingDio();
  getDataUsingHttp();
}

void getDataUsingHttp() async {
  var res = await http.get(Uri.parse(url));
  print('Http : $res');   // Instance of 'Future<Response>'
  print('Http res.body : ${res.body}');   // {"item":{"name":"스나이퍼팩토리 플러터 과정","description":"스나이퍼팩토리의 플러터 과정입니다! 지금 바로 신청해볼까요?","image":"https://picsum.photos/200/200","price":4000000}}
  print('Http res.body.runtimeType : ${res.body.runtimeType}');   // String
}

void getDataUsingDio() async {
  var res = await dio.get(url);
  print('Dio : $res');    // {"item":{"name":"스나이퍼팩토리 플러터 과정","description":"스나이퍼팩토리의 플러터 과정입니다! 지금 바로 신청해볼까요?","image":"https://picsum.photos/200/200","price":4000000}}
  print('Dio res.data : ${res.data}');    // {item: {name: 스나이퍼팩토리 플러터 과정, description: 스나이퍼팩토리의 플러터 과정입니다! 지금 바로 신청해볼까요?, image: https://picsum.photos/200/200, price: 4000000}}
  print('Dio res.data.runtimeType : ${res.data.runtimeType}');  // _InternalLinkedHashMap<String, dynamic>
  print('Dio res.data item : ${res.data['item']['name']}');
}
