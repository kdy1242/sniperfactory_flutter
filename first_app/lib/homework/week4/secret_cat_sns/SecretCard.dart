
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:secret_cat_sdk/model/secret.dart';

class SecretCard extends StatelessWidget {
  const SecretCard({Key? key, required this.secret}) : super(key: key);
  final Secret secret;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 1,
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black12,
            ),
            title: Text(secret.author?.name ?? '익명의 누군가'),
            subtitle: Text(DateFormat('EEE, MM/d').format(secret.createdAt)),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(secret.secret),
          )
        ],
      ),
    );
  }
}
