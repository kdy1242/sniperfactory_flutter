
// floating button
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../page/history_page.dart';
import '../page/search_page.dart';

Widget FloatingButton(context, breweries) {
  return SpeedDial(
    overlayOpacity: 0.3,
    overlayColor: Colors.black.withOpacity(0.5),
    animatedIcon: AnimatedIcons.menu_close,
    visible: true,
    curve: Curves.bounceIn,
    children: [
      SpeedDialChild(
        backgroundColor: Colors.white,
        child: Icon(Icons.search, color: Colors.black),
        labelWidget: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text('search', style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchPage(breweries: breweries)),
          );
        },
      ),
      SpeedDialChild(
        backgroundColor: Colors.white,
        child: Icon(Icons.list, color: Colors.black),
        labelWidget: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text('history', style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HistoryPage(breweries: breweries)),
          );
        },
      ),
    ],
  );
}
