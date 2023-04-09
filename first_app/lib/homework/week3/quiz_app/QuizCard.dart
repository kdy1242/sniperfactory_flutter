// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({Key? key, required this.quiz, required this.onCorrect, required this.onIncorrect}) : super(key: key);
  final Map<String, dynamic> quiz;
  final Function onCorrect;
  final Function onIncorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(quiz['question'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            ),
            Column(
              children: List.generate(
                quiz['options'].length, (index) => ElevatedButton(
                  // ElevatedButton 크기 고정
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 36),
                  ),
                  onPressed: (){
                    // 누른 버튼의 option 값이 정답과 같은지 판별
                    quiz['options'][index] == quiz['options'][quiz['answer']-1] ? onCorrect() : onIncorrect();
                  },
                  child: Text(quiz['options'][index])
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
