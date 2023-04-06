// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'ContactDetailPage.dart';
import 'package:flutter/material.dart';
import 'ContactData.dart';
import 'ContactTile.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: friendList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ContactTile(
              img: friendList[index].img,
              name: friendList[index].name,
              phone: friendList[index].phone,
            ),
            onTap: () {
              print(friendList[index].name);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactDetailPage(friend: friendList[index])),

              );
            },
          );
        }
      ),
    );
  }
}
