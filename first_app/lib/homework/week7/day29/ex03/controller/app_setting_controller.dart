
import 'package:get/get.dart';

class AppSettingController extends GetxController {
  bool isSoundOn;
  bool isNotificationOn;
  String appVersion;
  String appName;
  String appAuthor;
  String appPackageName;
  DateTime? lastUpdated;

  AppSettingController({
    required this.isSoundOn,
    required this.isNotificationOn,
    required this.appVersion,
    required this.appName,
    required this.appAuthor,
    required this.appPackageName,
    this.lastUpdated = null,
  });

  @override
  String toString() => 'sound : $isSoundOn, notification : $isNotificationOn, updated : $lastUpdated';
}
