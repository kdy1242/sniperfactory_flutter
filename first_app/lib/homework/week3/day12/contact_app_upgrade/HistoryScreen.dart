// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'ContactData.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: callRecordList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(callRecordList[index].name),
            trailing: Icon(
              (() {
                switch (callRecordList[index].callType) {
                  case CallType.incoming:
                    return Icons.call_received;
                  case CallType.outgoing:
                    return Icons.call_made;
                  case CallType.missed:
                    return Icons.call_missed;
                  default:
                    return Icons.call;
                }
              }()), // 함수를 선언과 동시에 실행시키고 결과값 반환
            ),
          );
        }
      ),
    );
  }
}

