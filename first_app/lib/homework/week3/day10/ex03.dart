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
  bool isClicked = false;
  Color color;

  SwitchingItem(this.icon, this.name, this.color);
}

class Switching extends StatefulWidget {
  const Switching({Key? key}) : super(key: key);

  @override
  State<Switching> createState() => _SwitchingState();
}

class _SwitchingState extends State<Switching> {
  List<SwitchingItem> switchingItems = [
    SwitchingItem(Icons.sunny, 'Sun', Colors.red),
    SwitchingItem(Icons.nightlight, 'Moon', Colors.yellow),
    SwitchingItem(Icons.star, 'Star', Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
      ),
    );
  }
}

