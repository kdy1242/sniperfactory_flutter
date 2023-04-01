// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

void main() {
  runApp(const MyApp());
}

class Friend {
  String img;
  String name;
  String message;
  String? music;

  Friend({required this.img, required this.name, required this.message, this.music});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Friend> friends = [
      Friend(img: 'http://picsum.photos/48/48', name: '전여친', message: '똥차다음벤츠라더니', music: '똥밟았네'),
      Friend(img: 'http://picsum.photos/48/48', name: '전여친', message: '똥차다음벤츠라더니', music: '똥밟았네'),
      Friend(img: 'http://picsum.photos/48/48', name: '전여친', message: '똥차다음벤츠라더니'),
      Friend(img: 'http://picsum.photos/48/48', name: '전여친', message: '똥차다음벤츠라더니', music: '똥밟았네'),
      Friend(img: 'http://picsum.photos/48/48', name: '전여친', message: '똥차다음벤츠라더니', music: '똥밟았네'),
      Friend(img: 'http://picsum.photos/48/48', name: '전여친', message: '똥차다음벤츠라더니', music: '똥밟았네'),
      Friend(img: 'http://picsum.photos/48/48', name: '전여친', message: '똥차다음벤츠라더니'),
      Friend(img: 'http://picsum.photos/48/48', name: '전여친', message: '똥차다음벤츠라더니', music: '똥밟았네'),
      Friend(img: 'http://picsum.photos/48/48', name: '전여친', message: '똥차다음벤츠라더니', music: '똥밟았네'),
      Friend(img: 'http://picsum.photos/48/48', name: '전여친', message: '똥차다음벤츠라더니', music: '똥밟았네'),
      Friend(img: 'http://picsum.photos/48/48', name: '전여친', message: '똥차다음벤츠라더니'),
      Friend(img: 'http://picsum.photos/48/48', name: '전여친', message: '똥차다음벤츠라더니', music: '똥밟았네'),
    ];

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            elevation: 0,
            centerTitle: false,
            title: Text('친구'),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.person_add_alt),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.music_note_outlined),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.settings_outlined),
              )
            ],
          ),
          body: ListView(
            children: [
              SizedBox(
                height: 80,
                child: PageView(
                  children: [
                    Image.asset('assets/images/kakaotalk/event_1.png'),
                    Image.asset('assets/images/kakaotalk/event_2.png'),
                  ],
                ),
              ),
              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network('http://picsum.photos/50/50'),
                ),
                title: Text('SFAC', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 8, 20),
                child: Divider(
                  height: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('친구 ${friends.length}'),
              ),
              Column(
                children: List.generate(
                  friends.length, (index) => ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(friends[index].img),
                  ),
                  title: Text(friends[index].name, style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(friends[index].message),
                  // music이 존재하면 trailing 보여주고 없으면 안보여주기
                  trailing: friends[index].music != null ?
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(friends[index].music!),
                          Icon(Icons.play_arrow_outlined,color: Colors.green,),
                        ],
                      ),
                    ) : null,
                  ),
                )
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'friends'),
              BottomNavigationBarItem(
                icon: badges.Badge(
                  badgeContent: Text('99', style: TextStyle(color: Colors.white),),
                  child: Icon(Icons.chat_bubble_outlined),), label: 'message'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.remove_red_eye_outlined), label: 'view'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_business), label: 'shop'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz), label: 'more'),
            ],
          ),
        )
    );
  }
}
