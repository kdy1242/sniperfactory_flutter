
import 'package:flutter/material.dart';

void main() {
  nullMap();
}

test() {
  String message = 'hello';
  Text(message);

  String? message2 = null;
  Text(message2!);
}

void nullMap() {
  Map<String, dynamic> mapData = {
    'myAge': 99,
    'myName': 'asdf'
  };
  print(mapData['myAge']);
  print(mapData['myHeight'] ?? '존재하지 않는 데이터입니다');
}
