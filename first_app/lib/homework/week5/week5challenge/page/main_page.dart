
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'bin_page.dart';
import 'search_page.dart';
import '../model/Email.dart';
import '../widget/mail_item.dart';


class MailPage extends StatefulWidget {
  const MailPage({Key? key}) : super(key: key);

  @override
  State<MailPage> createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {
  Dio dio = Dio();
  RefreshController refreshController = RefreshController(initialRefresh: false);
  ScrollController scrollController = ScrollController();

  List<Email> emails = [];
  List<Email> deletedEmails = [];
  bool isSortAscending = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  // 데이터 가져오기
  void getData() async {
    final res = await dio.get('https://sfacassignmentchallenge-default-rtdb.europe-west1.firebasedatabase.app/.json');
    List<dynamic> emailList = res.data['emails'];
    setState(() {
      emails = emailList.map((e) => Email.fromMap(e)).toList();
      getDeletedEmails(emails);
    });
  }

  // 삭제된 메일 리스트 만들기
  void getDeletedEmails(List<Email> emails) {
    for (var email in emails) {
      if (email.isDeleted) {
        deletedEmails.add(email);
      }
    }
    print(deletedEmails.toString());
    print('test');
  }

  // 새로고침
  void onRefresh() async {
    setState(() {});
    refreshController.refreshCompleted();
  }

  // 시간순으로 정렬
  void sortEmails() {
    setState(() {
      isSortAscending = !isSortAscending;
      emails.sort((a, b) {
        if (isSortAscending) {
          return a.sendDate.compareTo(b.sendDate);
        } else {
          return b.sendDate.compareTo(a.sendDate);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('프로모션 '),
              Container(
                width: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                ),
              ),
              Text(' ${emails.length}', style: TextStyle(color: Colors.green),),
            ],
          ),
          onTap: () {
            scrollController.animateTo(
              0,
              duration: Duration(milliseconds: 300),
              curve: Curves.linear,
            );
          }
        ),
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            icon: Icon(Icons.access_time),
            onPressed: sortEmails,
          )
        ],
      ),
      body: FutureBuilder(
        future: dio.get('https://sfacassignmentchallenge-default-rtdb.europe-west1.firebasedatabase.app/.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SmartRefresher(
              controller: refreshController,
              enablePullDown: true,
              onRefresh: onRefresh,
              header: WaterDropHeader(),
              child: ListView.builder(
                controller: scrollController,
                itemCount: emails.length + 1,
                itemBuilder: (context, index) {
                  // 검색
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: GestureDetector(
                        child: Container(
                          color: Colors.grey[350],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.search, color: Colors.grey,),
                                Text('메일 검색', style: TextStyle(color: Colors.grey),)
                              ],
                            ),
                          )
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SearchPage()),
                          );
                        },
                      ),
                    );
                  }
                  Email email = emails[index-1];
                  print(email);
                  return MailItem(email: email);
                }
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.delete_outline),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BinPage(deletedEmails: deletedEmails)),
          );
        },
      ),
    );
  }
}
