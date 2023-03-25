import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var sf = "스나이퍼팩토리 ";
    List<String> text = [sf+"홈페이지", sf+"인스타그램", sf+"네이버블로그", sf+"티스토리", sf+"카카오톡채널", sf+"유튜브", "젭(ZEP) PW:sfac"];
    Widget gether = Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(
                                  width:50,
                                  height:50,
                                    'https://gongd.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fae9c8e1c-59ed-4933-8e94-7bbbadb5bb2e%2FUntitled.png?id=2f756889-33cb-4eb6-9b2a-6b02d2ef36c3&table=block&spaceId=f1b22865-ad87-4ce2-a68e-4d7c57ebefa7&width=1990&userId=&cache=v2',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Text("게더"),
                            ),
                            Expanded(
                              flex: 2,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.all(Radius.circular(15))
                                    ),
                                  ),
                                  Text("추가하기")
                                ],
                              )
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("메타버스 교육의 효과를 경험해보세요."),
                            ],
                          ),
                        )
                      ],
                    );

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView.builder(
            itemCount: text.length + 1,
            itemBuilder: (context, index) {
                if (index == 0) return gether;
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          width:50,
                          height:50,
                            'https://gongd.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fae9c8e1c-59ed-4933-8e94-7bbbadb5bb2e%2FUntitled.png?id=2f756889-33cb-4eb6-9b2a-6b02d2ef36c3&table=block&spaceId=f1b22865-ad87-4ce2-a68e-4d7c57ebefa7&width=1990&userId=&cache=v2',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(text[index-1]),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.more_horiz,),
                        ],
                      ),
                    ),
                  ],
              );
            },
          ),
        ),
      )
    );
  }
}
