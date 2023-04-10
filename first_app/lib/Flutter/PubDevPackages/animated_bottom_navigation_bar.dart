
import 'package:animate_do/animate_do.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:badges/badges.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pageController = PageController();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('단어 보여주기'),
        ),
        body: PageView.builder(
          controller: pageController,
          itemCount: nouns.length,
          itemBuilder: (context, index) => ZoomIn(
            duration: Duration(milliseconds: 1500),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Badge(
                    // Badge 안에 표시할 위젯
                      badgeContent: Text('A'),
                      // Badge 위치
                      position: BadgePosition.topEnd(),
                      child: Text(
                        nouns[index],
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                      )
                  ),
                  IconButton(
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: nouns[index],
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    },
                    icon: FaIcon(FontAwesomeIcons.airbnb)
                  ),
                ],
              )
            )
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.bounceOut);
          },
          backgroundColor: Colors.amber,
          child: Icon(Icons.navigate_next),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: Colors.amber,
          icons: [
            FontAwesomeIcons.airbnb,
            FontAwesomeIcons.facebook,
          ],
          activeIndex: 1,
          gapLocation: GapLocation.center,
          onTap: (_) {
            print(_);
          },
        ),
      ),
    );
  }
}