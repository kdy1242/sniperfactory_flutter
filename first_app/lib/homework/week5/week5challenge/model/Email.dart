
import 'package:intl/intl.dart';

class Email {
  int emailNo;
  String from;
  String title;
  String detail;
  DateTime sendDate;
  bool isDeleted;

  Email({
    required this.emailNo,
    required this.from,
    required this.title,
    required this.detail,
    required this.sendDate,
    this.isDeleted = false,
  });

  factory Email.fromMap(Map<String, dynamic> map) {
    return Email(
      emailNo: map['emailNo'],
      from: map['from'],
      title: map['title'],
      detail: map['detail'],
      sendDate: DateFormat('yyyy.MM.dd').parse(map['sendDate']),
    );
  }

  @override
  String toString() => 'Mail($from, 삭제($isDeleted))';
}
