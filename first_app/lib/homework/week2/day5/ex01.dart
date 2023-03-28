// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List menu = ['홈', '커뮤니티'];
    String moveText = '';
    String name = '스나이퍼팩토리';

    bool checkBottomConsonant(String input){  // 한글 종성 판별
      return (input.runes.last - 0xAC00) % 28!=0;
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 110,
                child: DrawerHeader(
                    margin: EdgeInsets.only(bottom: 5),
                    padding: EdgeInsets.fromLTRB(0, 16.0, 0, 16),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Text(name.substring(0, 1)),
                      ),
                      title: Text(name),
                      subtitle: Text('안녕하세요, 스팩입니다.'),
                    )
                ),
              ),
              Column(
                children: List.generate(menu.length, (index) {
                  checkBottomConsonant(menu[index]) ? moveText = '으로 이동' : moveText = '로 이동';
                  return ListTile(
                    title: Text(menu[index]),
                    subtitle: Text(menu[index] + moveText),
                  );
                })
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: ListTile(
                    title: Text('로그아웃'),
                    subtitle: Text('로그아웃합니다.'),
                    trailing: Icon(Icons.logout),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
