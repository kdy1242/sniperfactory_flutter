// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({Key? key, required this.name, required this.phone, required this.imgUrl}) : super(key: key);

  final String name;
  final String phone;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(phone),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imgUrl),
      ),
      trailing: Icon(Icons.call),
    );
  }
}
