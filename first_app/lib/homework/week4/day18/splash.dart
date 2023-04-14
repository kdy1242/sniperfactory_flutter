
import 'package:first_app/homework/week4/day18/secret_hamburger.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3), // 3초 동안 Splash Screen 표시
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SecretHamburger()),
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