// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:first_app/homework/week2/kiosk/MenuTile.dart';
import 'package:flutter/material.dart';

import 'AdminPage.dart';


void main() {
  runApp(const MyApp());
}

class Menu {
  String imgUrl;
  String name;

  Menu(this.imgUrl, this.name);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Kiosk(),
    );
  }
}

class Kiosk extends StatefulWidget {
  const Kiosk({Key? key}) : super(key: key);

  @override
  State<Kiosk> createState() => _KioskState();
}

class _KioskState extends State<Kiosk> {
  List<Menu> menuList = [
    Menu('assets/images/kiosk/option_bokki.png', '떡볶이'),
    Menu('assets/images/kiosk/option_beer.png', '맥주'),
    Menu('assets/images/kiosk/option_kimbap.png', '김밥'),
    Menu('assets/images/kiosk/option_omurice.png', '오므라이스'),
    Menu('assets/images/kiosk/option_pork_cutlets.png', '돈까스'),
    Menu('assets/images/kiosk/option_ramen.png', '라면'),
    Menu('assets/images/kiosk/option_udon.png', '우동'),
  ];

  // 주문할 메뉴들이 담긴 리스트
  List<String> orderList = [];
  // 주문할 메뉴와 각각의 개수를 키와 값 형태로 저장
  Map<String, int> countMenu = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            child: Text('분식왕 이테디 주문하기', style: TextStyle(color: Colors.black),),
            onDoubleTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AdminPage()),
              );
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('주문 리스트',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  SizedBox(
                      height: 40,
                      child: countMenu.isNotEmpty ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: countMenu.length,
                        itemBuilder: (context, index) {
                          String menu = countMenu.keys.elementAt(index);
                          int count = countMenu[menu] ?? 0;
                          return Chip(
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(menu),
                                Text('$count'),
                              ],
                            ),
                            onDeleted: () {
                              setState(() {
                                countMenu[menu] != null && countMenu[menu]! > 1 ?
                                countMenu[menu] = (countMenu[menu]! - 1) : countMenu.remove(menu);
                              });
                            },
                          );
                        },
                      ) : Center(child: Text('주문한 메뉴가 없습니다'))
                  ),
                  Text('음식',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: menuList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // 클릭한 메뉴 이름을 변수로 선언
                            String tapMenu = menuList[index].name;
                            // orderList에 클릭한 메뉴 이름 추가
                            orderList.add(tapMenu);

                            // countMenu 가 클릭한 메뉴를 키로 가지고 있다면
                            if(countMenu.containsKey(tapMenu)){
                              // 해당 키의 카운트 값 +1
                              countMenu[tapMenu] = countMenu[tapMenu]! + 1;
                            } else {
                              // 클릭한 메뉴를 키로 가지고 있지 않다면 카운트 값 1로 설정
                              countMenu[tapMenu] = 1;
                            }
                          });
                        },
                        child: MenuTile(
                            imgUrl: menuList[index].imgUrl,
                            name: menuList[index].name));
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1 / 1,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                  ),
                ],
              ),
            )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: countMenu.isNotEmpty ?
        FloatingActionButton.extended(
          onPressed: () {},
          label: Text('결제하기'),
        ) : null
    );
  }
}
