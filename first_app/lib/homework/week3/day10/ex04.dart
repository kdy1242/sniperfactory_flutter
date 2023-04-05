// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Switching(),
    );
  }
}

class SwitchingItem {
  IconData icon;
  String name;
  String krName;
  bool isClicked = false;
  Color color;

  SwitchingItem(this.icon, this.name, this.krName, this.color);
}

class Switching extends StatefulWidget {
  const Switching({Key? key}) : super(key: key);

  @override
  State<Switching> createState() => _SwitchingState();
}

class _SwitchingState extends State<Switching> {
  List<SwitchingItem> switchingItems = [
    SwitchingItem(Icons.sunny, 'Sun', '태양', Colors.red),
    SwitchingItem(Icons.nightlight, 'Moon', '달', Colors.yellow),
    SwitchingItem(Icons.star, 'Star', '별', Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: List.generate(
                switchingItems.length, (index) => ListTile(
                  leading: Icon(
                    switchingItems[index].icon,
                    color: switchingItems[index].isClicked ? switchingItems[index].color : null,
                  ),
                  title: Text(switchingItems[index].name),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        switchingItems[index].isClicked = !switchingItems[index].isClicked;
                      });
                    },
                    icon: Icon(Icons.arrow_right),
                  ),
                )
              ),
            ),
            TextField(
              onSubmitted: (String text) {
                setState(() {
                  switchingItems.forEach((switchingItem) {
                    if(switchingItem.krName == text) switchingItem.isClicked = !switchingItem.isClicked;
                  });
                });
              },
              decoration: InputDecoration(
                hintText: '키고 끄고싶은 아이콘을 입력하세요.',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            switchingItems.forEach((switchingItem) {
              switchingItem.isClicked = false;
            });
          });
        },
        child: Icon(Icons.restart_alt),
      ),
    );
  }
}

