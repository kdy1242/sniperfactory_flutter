
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  print(await SecretCatApi.fetchSecrets());
                },
                child: Text('비밀 불러오기')
              ),
              // 비밀 불러오기
              FutureBuilder(
                future: SecretCatApi.fetchSecrets(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done) {
                    return Text(snapshot.data!.first.secret);
                  }
                  return LinearProgressIndicator();
                }
              ),
              // 유저 불러오기
              FutureBuilder(
                future: SecretCatApi.fetchAuthors(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done) {
                    return snapshot.data!.first.avatar != null
                      ? CircleAvatar(backgroundImage: NetworkImage(snapshot.data!.first.avatar!))
                      : SizedBox();
                  }
                  return LinearProgressIndicator();
                }
              ),
              // 유저 listTile 만들어보기
              FutureBuilder(
                future: SecretCatApi.fetchAuthors(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done) {
                    return ListTile(
                      leading: snapshot.data!.first.avatar != null
                        ? CircleAvatar(backgroundImage: NetworkImage(snapshot.data!.first.avatar!))
                        : CircleAvatar(
                            child: Text(snapshot.data!.first.username[0]),
                          ),
                      title: Text(snapshot.data!.first.username),
                      subtitle: Text(snapshot.data!.first.id),
                    );
                  }
                  return LinearProgressIndicator();
                }
              ),
              // 비밀 등록하기
              TextButton(
                onPressed: () async {
                  var secret = await SecretCatApi.addSecret('asdfasdfasdfasdf');
                  print(secret);
                },
                child: Text('비밀 업로드')
              ),
              TextButton(
                onPressed: () async {
                  var secret = await SecretCatApi.fetchSecrets();
                  print(secret.last);
                },
                child: Text('비밀 확인'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

