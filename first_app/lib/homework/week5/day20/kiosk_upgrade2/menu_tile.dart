
import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({Key? key, required this.imgUrl, required this.name}) : super(key: key);

  final String imgUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 1,
            )
          ]
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 75,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover,)
              ),
            ),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
            Text('[담기]'),
          ],
        ),
      ),
    );
  }
}
