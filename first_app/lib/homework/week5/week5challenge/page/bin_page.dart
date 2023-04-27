
import 'package:first_app/homework/week5/week5challenge/widget/mail_item.dart';
import 'package:flutter/material.dart';

import '../model/Email.dart';

class BinPage extends StatefulWidget {
  const BinPage({Key? key, required this.deletedEmails}) : super(key: key);

  final List<Email> deletedEmails;

  @override
  State<BinPage> createState() => _BinPageState();
}

class _BinPageState extends State<BinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('휴지통'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.deletedEmails.length,
        itemBuilder: (context, index) {
          return MailItem(email: widget.deletedEmails[index]);
        }
      ),
    );
  }
}

