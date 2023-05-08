
import 'package:flutter/material.dart';

import '../../model/user.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key, required this.user, required this.onTap}) : super(key: key);

  final User user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(

          ),
          title: Text(user.username),
          subtitle: Text(user.name),
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('로그아웃하기'),
          onTap: onTap,
        ),
      ],
    );
  }
}
