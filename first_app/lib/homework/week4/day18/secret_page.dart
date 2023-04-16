
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

class SecretPage extends StatefulWidget {
  const SecretPage({Key? key}) : super(key: key);

  @override
  State<SecretPage> createState() => _SecretPageState();
}

class _SecretPageState extends State<SecretPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/secret_hamburger/SecretPage-background.png'),
                fit: BoxFit.fill
            )
        ),
        child: Column(
          children: [
            SizedBox(height: 50),
            Expanded(
              child: FutureBuilder(
                  future: SecretCatApi.fetchSecrets(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.done) {
                      return PageView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var author = snapshot.data![index].author ?? '익명';
                          return Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ListTile(
                                    leading: ZoomIn(child: SizedBox(child: Image.asset('assets/images/secret_hamburger/main-icon.png'))),
                                    title: FadeInLeft(child: Text(author.toString())),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ZoomIn(
                                      child: Container(
                                        width: 200,
                                        height: 100,
                                        color: Colors.grey[200],
                                        child: Text(snapshot.data![index].secret),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                      );
                    }
                    return Container();
                  }
              ),
              ),
            Text('먹을게~', style: TextStyle(fontSize: 20),),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}