

import 'package:get/get.dart';

class AppGlobalDataController extends GetxController {
  String name;
  int age;
  List<String> memos;

  AppGlobalDataController({required this.name, required this.age, required this.memos});
}