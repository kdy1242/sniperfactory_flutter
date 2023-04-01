// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class MusicTile extends StatelessWidget {
  const MusicTile({Key? key, required this.imgUrl, required this.title, required this.singer, required this.time}) : super(key: key);

  final String imgUrl;
  final String title;
  final String singer;
  final String time;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(imgUrl),
      ),
      title: Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
      subtitle: Row(
        children: [
          Icon(Icons.check_circle),
          Container(
            child: Text(singer, overflow: TextOverflow.ellipsis),
            constraints: BoxConstraints(
              maxWidth: 180
            )
          ),
          Text(' · $time'),
        ],
      ),
      trailing: Icon(Icons.more_vert),
    );
  }
}
