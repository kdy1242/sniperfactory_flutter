
import 'dart:convert';

import 'package:dio/dio.dart';

class Slip {
  int id;
  String advice;

  Slip({required this.id, required this.advice});

  factory Slip.fromMap(Map<String, dynamic> map) {
    return Slip(id: map['id'], advice: map['advice']);
  }

  @override
  toString() => advice;
}

void main() async {
  Dio dio = Dio();
  var url = 'https://api.adviceslip.com/advice';

  var res = await dio.get(url);
  if (res.statusCode == 200) {
    var myData = jsonDecode(res.data);
    var slipData = Slip.fromMap(myData['slip']);
    print(slipData);
  }
}
