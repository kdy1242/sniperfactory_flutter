
import 'package:dio/dio.dart';

class CatFact {
  String fact;
  int length;

  CatFact({required this.fact, required this.length});

  factory CatFact.fromMap(Map<String, dynamic> map) {
    return CatFact(fact: map['fact'], length: map['length']);
  }

  factory CatFact.fromFact(String fact) {
    return CatFact(fact: fact, length: fact.length);
  }

  @override
  String toString() => 'CatFact(fact: $fact, length: $length)';
}

void main() async {
  Dio dio = Dio();
  var url = 'https://catfact.ninja/fact';

  var res = await dio.get(url);
  if (res.statusCode == 200) {
    var catFact = CatFact.fromMap(res.data);
    print(catFact);

    var data = CatFact.fromFact(res.data['fact']);
    print(data);
  }
}
