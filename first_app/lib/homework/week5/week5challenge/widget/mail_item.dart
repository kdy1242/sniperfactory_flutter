
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/Email.dart';

class MailItem extends StatefulWidget {
  const MailItem({Key? key, required this.email}) : super(key: key);

  final Email email;

  @override
  State<MailItem> createState() => _MailItemState();
}

class _MailItemState extends State<MailItem> {

  var now = DateTime.now();

  String dateText (DateTime dateTime) {
    if (now.difference(dateTime).inDays == 0) {
      return '오늘';
    } else if (now.difference(dateTime).inDays == 1) {
      return '어제';
    } else if (now.year == dateTime.year) {
      return DateFormat('MM.dd').format(dateTime);
    }
    return DateFormat('yyyy.MM.dd').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {

    String sendDate = dateText(widget.email.sendDate);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(widget.email.from, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(sendDate),
                  ),
                  Icon(Icons.star, color: Colors.grey,)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        child: Text('TO', style: TextStyle(color: Colors.white, fontSize: 14),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(widget.email.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 16, right: 8),
                child: Text(widget.email.detail, style: TextStyle(fontSize: 18, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

