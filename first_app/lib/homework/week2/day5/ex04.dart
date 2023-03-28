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
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(250),
          child: AppBar(
            title: Text('CGB (영화 예매)', style: TextStyle(fontSize: 22),),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/400/500'),
                    fit: BoxFit.fill
                )
              ),
            ),
            elevation: 0,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              ListTile(
                title: Text('속초 여행을 떠나면서', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                trailing: SizedBox(
                  width: 65,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.visibility, color: Colors.black,),
                      Text('232회')
                    ],
                  )
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12))),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('https://picsum.photos/50/50'),
                  ),
                  title: Text('오류동 멋쟁이'),
                  subtitle: Text('스나이퍼팩토리 누군가'),
                  trailing: Text('3시간전'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('속에서 구하지 위하여서, 밝은 하였으며, 것은 그들은 봄바람이다. 얼마나 관현악이며, 사는가 전인 싹이 뿐이다. 구하기 평화스러운 투명하되 그러므로 하는 뿐이다. 새 피가 품으며, 있는가? 무엇이 커다란 피어나는 인생에 것이다. 대고, 품고 꾸며 곳이 교향악이다. 피어나기 대중을 보는 인생을 내는 그들의 있는 철환하였는가? 심장은 이상은 전인 대고, 속에서 끝에 없는 이성은 설산에서 이것이다. 속잎나고, 길지 너의 지혜는 것은 우는 미묘한 보라. 커다란 석가는 남는 황금시대의 피고, 이상을 끓는다.'),
              )
            ],
          ),
        ),
      )
    );
  }
}
