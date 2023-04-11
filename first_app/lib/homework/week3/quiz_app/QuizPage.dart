// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:first_app/homework/week3/quiz_app/QuizCard.dart';
import 'package:flutter/material.dart';
import 'quiz.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  var pageController = PageController(viewportFraction: 0.8);

  List<Widget> score = List<Widget>.filled(quizs.length, Icon(null));

  // 버튼 눌렀을 때 정답인지 아닌지 판별하고, 판별 결과에 따라 appBar에 아이콘을 추가할 함수들
  void onCorrect() {
    setState(() {
      pageController.nextPage(duration: Duration(seconds: 2), curve: Curves.linear);
      int pageIndex = pageController.page!.toInt();
      score[pageIndex] = Icon(Icons.circle_outlined);
    });
  }

  void onIncorrect() {
    setState(() {
      pageController.nextPage(duration: Duration(seconds: 2), curve: Curves.linear);
      int pageIndex = pageController.page!.toInt();
      score[pageIndex] = Icon(Icons.close);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: score,
        ),
        leading: IconButton(
          iconSize: 30,
          icon: Icon(Icons.navigate_before),
          onPressed: () {
            pageController.previousPage(duration: Duration(seconds: 2), curve: Curves.linear);
          },
        ),
        actions: [
          IconButton(
            iconSize: 30,
            icon: Icon(Icons.navigate_next),
            onPressed: () {
              pageController.nextPage(duration: Duration(seconds: 2), curve: Curves.linear);
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.pinkAccent,
              Colors.blue
            ],
          )
        ),
        child: SafeArea(
          child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            itemCount: quizs.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 15),
                child: QuizCard(quiz: quizs[index], onCorrect: onCorrect, onIncorrect: onIncorrect,),
              );
            }, 
          ),
        ),
      ),

      floatingActionButton: score.last != Icon(null) ? FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: Icon(Icons.restart_alt),
        onPressed: () {
          setState(() {
            pageController.jumpTo(0);
            score = List<Widget>.filled(quizs.length, Icon(null));
          });
        },
      ) : null,
    );
  }
}
