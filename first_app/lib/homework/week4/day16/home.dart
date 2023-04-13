
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'GridViewItem.dart';
import 'ShimmerGridView.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var dio = Dio();
  var url = 'https://sniperfactory.com/sfac/read_dogs';

  RefreshController refreshController = RefreshController(initialRefresh: false);

  bool isLoading = false; // 로딩 중 상태
  bool internetConnected = true; // 인터넷 연결 상태

  // 새로고침
  void onRefresh() async {
    setState(() {});
    refreshController.refreshCompleted();
  }

  // 인터넷 연결 상태 체크
  Future checkInternetConnection() async {
    setState(() {
      isLoading = true;    // 로딩 시작
    });
    await Future.delayed(Duration(seconds: 1));
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {    // 인터넷 연결 없음
      setState(() {
        internetConnected = false;
      });
    } else {    // 인터넷 연결 있음
      setState(() {
        internetConnected = true;
      });
    }
    setState(() {    // 로딩 종료
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('16일차 과제'),
      ),
      body: isLoading // 로딩 중일 때
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('인터넷 연결 확인 중입니다'),
                  CircularProgressIndicator()
                ],
              )
            )
          : internetConnected // 로딩중 아니면 인터넷 연결 여부 검사
            ? FutureBuilder(  // 인터넷 연결 있을 때
                future: Future.delayed(Duration(seconds: 1), () => dio.get(url)),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting) {
                    return ShimmerGridView();
                  }
                  var data = snapshot.data?.data['body'];
                  if (snapshot.hasData && data != null) {
                    return SmartRefresher(
                      controller: refreshController,
                      enablePullDown: true,
                      onRefresh: onRefresh,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 3/4,
                        ),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return GridItem(url: data[index]['url'], msg: data[index]['msg']);
                        }
                      ),
                    );
                  } else {
                    return ShimmerGridView();
                  }
                },
              )
            : Center(   // 인터넷 연결 x
                child: Text('인터넷 연결 없음'),
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: checkInternetConnection,
        child: Icon(Icons.wifi_find),
      ),
    );
  }
}
