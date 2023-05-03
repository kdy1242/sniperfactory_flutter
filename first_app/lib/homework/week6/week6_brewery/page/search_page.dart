
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:first_app/homework/week6/week6_brewery/widget/brewery_tile.dart';
import 'package:flutter/material.dart';

import '../model/brewery.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.breweries}) : super(key: key);

  final List<Brewery> breweries;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<Brewery> searchResult = [];  // 검색 결과

  // 데이터 불러오기
  getData(String keyword) async {
    Dio dio = Dio();
    String url = 'https://api.openbrewerydb.org/v1/breweries/search?query=$keyword';

    try {
      var res = await dio.get(url);
      if (res.statusCode == 200) {
        var data = List<Map<String, dynamic>>.from(res.data);
        searchResult = data.map((e) => Brewery.fromMap(e)).toList();
      }
    } on DioError {   // 검색 결과 없거나 에러 발생시 빈 리스트로 초기화
      searchResult = [];
    }
    log('$searchResult');
    setState(() { });
  }

  @override
  void initState() {
    super.initState();

    // 검색 전에는 전체 리스트 보여주기
    searchResult = widget.breweries;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
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
          Expanded(
            child: ListView.builder(
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                var brewery = searchResult[index];
                return BreweryTile(brewery: brewery);
              }
            ),
          ),
        ],
      ),
    );
  }
}
