
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:secret_cat_sdk/api/api.dart';

import 'SecretCard.dart';

class SecretScreen extends StatefulWidget {
  const SecretScreen({Key? key}) : super(key: key);

  @override
  State<SecretScreen> createState() => _SecretScreenState();
}

class _SecretScreenState extends State<SecretScreen> {
  RefreshController refreshController = RefreshController(initialRefresh: false);

  // 새로고침
  void onRefresh() async {
    setState(() {});
    refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SecretCatApi.fetchSecrets(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SmartRefresher(
            controller: refreshController,
            enablePullDown: true,
            onRefresh: onRefresh,
            header: WaterDropHeader(),
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SecretCard(secret: snapshot.data![index]),
                );
              },
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },

    );
  }
}
