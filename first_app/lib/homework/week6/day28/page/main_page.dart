
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:first_app/homework/week6/day28/widget/meaning_card.dart';
import 'package:flutter/material.dart';

import '../model/dict.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Dict? _word;

  getData(String word) async {
    Dio dio = Dio();
    String url = 'https://api.dictionaryapi.dev/api/v2/entries/en/$word';

    try {
      var res = await dio.get(url);
      if (res.statusCode == 200) {
        _word = Dict.fromMap(res.data.first);
      }
    } on DioError {
      _word = null;
    }
    print(_word);
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary App'),
        elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Search",
                        suffixIcon: Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onSubmitted: (value) {
                        getData(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
            if (_word != null) MeaningCard(word: _word!)
          ],
        ),
      ),
    );
  }
}