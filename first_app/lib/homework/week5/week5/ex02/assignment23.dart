
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'userdata.dart';

class Assignment23 extends StatefulWidget {
  const Assignment23({super.key});
  @override
  State<Assignment23> createState() => _Assignment23State();
}

class _Assignment23State extends State<Assignment23> {

  Future<Map<String, dynamic>> getJsonData() async {
    Dio dio = Dio();
    String url = 'https://sfacassignment23-default-rtdb.europe-west1.firebasedatabase.app/.json';

    return await dio.get(url).then((value) => value.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('23일차 과제')),
      body: Center(
          child: FutureBuilder(
              future: getJsonData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (!snapshot.hasData) return const Text("데이터가 없습니다");

                Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
                List<dynamic> users = data['users'];
                List<dynamic> dismissDuplicatedUsers = _dismissDuplicatedData(users);
                return ListView.separated(
                  itemBuilder: (context, index) {
                    UserData userData = UserData.fromMap(dismissDuplicatedUsers[index]);
                    return _buildItemWidget(userData);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: dismissDuplicatedUsers.length,
                );
              }
          )
      ),
    );
  }

  Widget _buildItemWidget(UserData userData) {
    return ListTile(
      leading: Image.network(userData.imageUrl),
      title: Text('${userData.firstName} ${userData.lastName}'),
      subtitle: Text('${userData.phoneNumber}'),
    );
  }

  List<dynamic> _dismissDuplicatedData(List<dynamic> data) {
    // 전체 UserData 리스트
    List<UserData> userList = data.map((e) => UserData.fromMap(e)).toList();

    // 중복 제거 UserData 리스트
    List<UserData> result = [];

    for (var user in userList) {
      // result에 user랑 같은 UserData 없으면 result에 user 추가
      if (!result.any((e) => e == user)) {
        result.add(user);
      }
    }

    return result.map((e) => e.toMap()).toList();
  }
}
