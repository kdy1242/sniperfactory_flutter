
import 'package:first_app/homework/week4/day18/author_page.dart';
import 'package:first_app/homework/week4/day18/upload_page.dart';
import 'package:flutter/material.dart';

import 'secret_page.dart';



class SecretHamburger extends StatelessWidget {
  const SecretHamburger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List menu = ['비밀 보러가기', '작성자 구경', '비밀 알려주기'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Image.asset('assets/images/secret_hamburger/main-icon.png'),
            ),
            Column(
              children: List.generate(
                menu.length, (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: ListTile(
                    leading: Image.asset('assets/images/secret_hamburger/hambuug.png'),
                    title: Text(menu[index]),
                    onTap: () {
                      switch(index) {
                        case 0:
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecretPage())
                          );
                          break;
                        case 1:
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AuthorPage())
                          );
                          break;
                        case 2:
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => UploadPage())
                          );
                          break;
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

