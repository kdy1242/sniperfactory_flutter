
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

class AuthorPage extends StatefulWidget {
  const AuthorPage({Key? key}) : super(key: key);

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: SecretCatApi.fetchAuthors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Flexible(
                        child: ZoomIn(
                          child: snapshot.data![index].avatar != null
                              ? Image.network(snapshot.data![index].avatar!)
                              : Image.asset('assets/images/secret_hamburger/main-icon.png'),
                        ),
                      ),
                      SizedBox(height: 10),
                      FadeInLeft(child: Text(snapshot.data![index].username)),
                    ],
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
            );
          }
          return LinearProgressIndicator();
        }
      ),
    );
  }
}

