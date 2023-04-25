
import 'package:dio/dio.dart';

class Activity {
  String activity;
  String type;
  int participants;
  double price;
  String link;
  String key;
  double accessibility;

  Activity({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  factory Activity.fromBoardApi(Map<String, dynamic> map) {
    return Activity(
      activity: map['activity'],
      type: map['type'],
      participants: map['participants'],
      price: map['price'] is int ? double.parse(map['price']) : map['price'],
      link: map['link'],
      key: map['key'],
      accessibility: map['accessibility'],
    );
  }

  @override
  String toString() {
    return 'Activity(activity: $activity, type: $type, participants: $participants, price: $price)';
  }
}

void main() async {
  Dio dio = Dio();
  var url = 'https://www.boredapi.com/api/activity';

  var res = await dio.get(url);
  if (res.statusCode == 200) {
    var activity = Activity.fromBoardApi(res.data);
    print(activity);
  }
}
