// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'ContactData.dart';
import 'ContactTile.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({Key? key, required this.friend}) : super(key: key);
  final Friend friend;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('연락처 상세'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.network(friend.img, fit: BoxFit.fill,)
          ),
          ContactTile(img: friend.img, name: friend.name, phone: friend.phone)
        ],
      ),
    );
  }
}
