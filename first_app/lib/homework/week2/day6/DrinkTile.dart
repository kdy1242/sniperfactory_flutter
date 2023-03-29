// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class DrinkTile extends StatelessWidget {
  const DrinkTile({Key? key, required this.img, required this.name, required this.engName, required this.price}) : super(key: key);

  final String img;
  final String name;
  final String engName;
  final int price;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(backgroundImage: AssetImage(img), radius: 48,),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Text(engName, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),),
                ),
                Text('$price원', style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ],
        ),
      );
  }
}
