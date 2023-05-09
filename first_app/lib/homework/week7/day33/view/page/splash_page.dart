
import 'main_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3), // 3초 동안 Splash Screen 표시
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/secret_hamburger/Splash.png'),
            fit: BoxFit.fill
          )
        ),
      )
    );
  }
}