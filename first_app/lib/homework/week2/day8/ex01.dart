// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  int x = 0;
  int y = 0;
  int result = 0;

  List<String> operatorList = ['더하기', '곱하기', '빼기', '나누기'];

  showResultDialog(BuildContext context, var result) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 150,
            child: Center(
              child: Text("$result",
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ),
          ),
        );
      },
    );
  }

  Widget textField(String xy) {
    return Row(
      children: [
        Spacer(),
        Text('$xy의 값은?'),
        Spacer(),
        SizedBox(
          width: 200,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '$xy값을 입력하세요',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                if (xy == 'x') {
                  x = int.parse(value);
                } else {
                  y = int.parse(value);
                }
              });
            },
          ),
        ),
        Spacer(),
      ],
    );
  }

  Widget button(BuildContext context, String operText) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          switch (operText) {
            case '더하기':
              result = x + y;
              break;
            case '곱하기':
              result = x * y;
              break;
            case '빼기':
              result = x - y;
              break;
            case '나누기':
              result = x ~/ y;
              break;
          }
          showResultDialog(context, result);
        });
      },
      child: Text('$operText의 결과값은?!'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('사칙연산'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textField('x'),
          textField('y'),
          Column(
            children: List.generate(operatorList.length, (index) {
              return button(context, operatorList[index]);
            })),
        ],
      ),
    );
  }
}
