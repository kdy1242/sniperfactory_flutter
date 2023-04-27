
import 'package:first_app/homework/week5/week5challenge/widget/mail_item.dart';
import 'package:flutter/material.dart';

import '../model/Email.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key, required this.email}) : super(key: key);

  final Email email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('검색 결과'),
      ),
      body: Column(
        children: [
          MailItem(email: email)
        ],
      ),
    );
  }
}

