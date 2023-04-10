
import 'dart:math';

import 'images.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RefreshPage(),
    );
  }
}

class RefreshPage extends StatefulWidget {

  @override
  State<RefreshPage> createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  // 앱 시작될 때 자동 새로고침 false
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  // 새로고침 작업 처리
  void _onRefresh() async {
    setState(() {
      _refreshController.refreshCompleted();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('14일차 과제 3'),
      ),
      body: SmartRefresher(
        // 아래로 당겼을 때 새로고침 기능 활성화
        enablePullDown: true,
        // 아래로 당겼을 때 물방울 모양 애니메이션
        header: WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            // imageUrl의 index로 0부터 imageUrl의 리스트 길이 사이에서 무작위 정수 생성
            child: Image.network(imageUrl[Random().nextInt(imageUrl.length)])
          ),
        )
      ),
    );
  }
}
