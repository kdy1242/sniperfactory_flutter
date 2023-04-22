
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin_page.dart';
import 'menu_tile.dart';

class Kiosk extends StatefulWidget {
  const Kiosk({Key? key}) : super(key: key);

  @override
  State<Kiosk> createState() => _KioskState();
}

class _KioskState extends State<Kiosk> {
  Dio dio = Dio();
  var url = 'http://52.79.115.43:8090/api/collections/options/records';
  SharedPreferences? prefs;

  // 주문할 메뉴와 각각의 개수를 키와 값 형태로 저장
  Map<String, int> countMenu = {};

  @override
  void initState() {
    super.initState();
    initPreferences();
  }

  initPreferences() async {
    prefs = await SharedPreferences.getInstance();

    // shared_preferences 에는 Map 타입의 데이터를 저장할 수 없음
    // Map을 json 문자열로 변환해서 저장하고 불러와야 한다
    if (prefs!.containsKey('countMenu')) {
      setState(() {
        Map<String, dynamic> decodeMenu = json.decode(prefs!.getString('countMenu')!);

        // Map<String, dynamic> 형태를 Map<String, int> 타입으로 캐스팅
        countMenu = decodeMenu.map((key, value) => MapEntry(key, value as int));
      });
    }
  }

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
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: countMenu.isNotEmpty
                    ? Wrap(
                      spacing: 10,
                      children: List.generate(countMenu.length, (index) {
                        String menu = countMenu.keys.elementAt(index);
                        int count = countMenu[menu]!;
                        return Chip(
                          label: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
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
                      }),
                    )
                    : Center(child: Text('주문한 메뉴가 없습니다'))
                ),
                Text('음식',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                FutureBuilder(
                  future: dio.get(url),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      var data = snapshot.data!.data['items'];
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              setState(() {
                                // 클릭한 메뉴 이름을 변수로 선언
                                String tapMenu = data[index]['menu'];
                                // countMenu 가 클릭한 메뉴를 키로 가지고 있다면
                                if(countMenu.containsKey(tapMenu)){
                                  // 해당 키의 카운트 값 +1
                                  countMenu[tapMenu] = countMenu[tapMenu]! + 1;
                                } else {
                                  // 클릭한 메뉴를 키로 가지고 있지 않다면 카운트 값 1로 설정
                                  countMenu[tapMenu] = 1;
                                }
                              });

                              if (prefs != null) {
                                // countMenu를 json 문자열로 인코딩하여 저장
                                String jsonMenu = json.encode(countMenu);
                                await prefs!.setString('countMenu', jsonMenu);
                              }
                            },
                            child: MenuTile(
                              imgUrl: data[index]['imageUrl'],
                              name: data[index]['menu']
                            )
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1 / 1,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }
                ),
              ],
            ),
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: countMenu.isNotEmpty ?
      FloatingActionButton.extended(
        onPressed: () {
        },
        label: Text('결제하기'),
      ) : null
    );
  }
}
