
import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/profile.dart';
import '../widget/profile_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  Future<List<Profile>> getData() async {
    Dio dio = Dio();
    String url = 'https://jsonplaceholder.typicode.com/users';
    var res = await dio.get(url);

    if (res.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(res.data);
      return data.map((e) => Profile.fromMap(e)).toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text('My Contacts'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var profiles = snapshot.data!;
            return ListView.builder(
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                var profile = profiles[index];
                return FadeInRight(
                  delay: Duration(milliseconds: 500*index),
                  child: ProfileItem(profile: profile),
                );
              }
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
