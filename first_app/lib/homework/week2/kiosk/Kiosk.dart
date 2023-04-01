// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:first_app/homework/week2/kiosk/MenuTile.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('분식왕 이테디 주문하기',
            style: TextStyle(color: Colors.black),),
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
                Text(countMenu.toString(),
                  style: TextStyle(fontSize: 16),),
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              orderList.clear();
              countMenu.clear();
            });
          },
          label: Text('초기화하기'),
        ),
      )
    );
  }
}
