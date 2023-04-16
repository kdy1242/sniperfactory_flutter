
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:secret_cat_sdk/api/api.dart';

class AuthorScreen extends StatefulWidget {
  const AuthorScreen({Key? key}) : super(key: key);

  @override
  State<AuthorScreen> createState() => _AuthorScreenState();
}

class _AuthorScreenState extends State<AuthorScreen> {
  RefreshController refreshController = RefreshController(initialRefresh: false);

  // 새로고침
  void onRefresh() async {
    setState(() {});
    refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SecretCatApi.fetchAuthors(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return SmartRefresher(
            controller: refreshController,
            enablePullDown: true,
            onRefresh: onRefresh,
            header: WaterDropHeader(),
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data![index].avatar!),
                  backgroundColor: Colors.deepOrange,
                ),
                title: Text(snapshot.data![index].name),
              )
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}
