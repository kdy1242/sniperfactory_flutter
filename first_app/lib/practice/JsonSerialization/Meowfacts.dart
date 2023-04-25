
import 'package:dio/dio.dart';

class MeowFact {
  List<String> data;

  MeowFact({required this.data});

  factory MeowFact.fromMap(Map<String, dynamic> map) {
    var data = List<String>.from(map['data']);
    return MeowFact(data: data);
  }

  @override
  String toString() => 'MeowFact($data)';
}

void main() async {
  Dio dio = Dio();
  var url = 'https://meowfacts.herokuapp.com/';
  for (int i=0; i<10; i++) {
    var res = await dio.get(url);
    if (res.statusCode == 200) {
      var fact1 = MeowFact.fromMap(res.data);
      print(fact1);
    }
  }
}
