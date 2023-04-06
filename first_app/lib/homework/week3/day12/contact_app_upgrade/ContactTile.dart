// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({super.key, required this.img, required this.name, required this.phone});

  final String img;
  final String name;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 50, height: 50,
        child: CircleAvatar(
          backgroundImage: NetworkImage(img),
        ),
      ),
      title: Text(name),
      subtitle: Text(phone),
      trailing: Icon(Icons.phone),
    );
  }
}
