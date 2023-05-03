
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:first_app/homework/week6/week6_brewery/widget/brewery_tile.dart';

import '../model/brewery.dart';
import 'package:flutter/material.dart';

class BreweryPage extends StatefulWidget {
  const BreweryPage({Key? key, required this.city}) : super(key: key);

  final String city;

  @override
  State<BreweryPage> createState() => _BreweryPageState();
}

class _BreweryPageState extends State<BreweryPage> {

  List<String> typeList = []; // 양조장 타입 리스트
  int selectedTabIdx = 0;     // 선택한 양조장 타입 버튼의 인덱스

  // 데이터 불러오기
  Future<List<Brewery>> getData() async {
    Dio dio = Dio();
    var url = 'https://api.openbrewerydb.org/v1/breweries?by_city=${widget.city}';
    var res = await dio.get(url);

    if (res.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(res.data);
      var breweries = data.map((e) => Brewery.fromMap(e)).toList();

      // breweries의 breweryType들을 Set 자료형으로 중복제거 후 리스트로 변환
      typeList = breweries.map((e) => e.breweryType).toSet().toList();
      log('$typeList');

      return breweries;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              var breweries = snapshot.data!;

              // 양조장 타입 버튼으로 필터링된 양조장 리스트
              List<Brewery> filteredBreweries = [];
              for (var brewery in breweries) {
                if (selectedTabIdx == 0) {
                  filteredBreweries.add(brewery);
                } else {
                  if (brewery.breweryType == typeList[selectedTabIdx-1]) {
                    filteredBreweries.add(brewery);
                  }
                }
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: typeList.length + 1,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ElevatedButton(
                              // 선택된 인덱스의 버튼만 색 변경
                              style: ElevatedButton.styleFrom(
                                foregroundColor: selectedTabIdx == index ? Colors.white : Colors.black,
                                backgroundColor: selectedTabIdx == index ? Colors.black : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                                )
                              ),
                              onPressed: (){
                                setState(() {
                                  // 선택된 인덱스 업데이트
                                  selectedTabIdx = index;
                                });
                              },
                              child: Text(index == 0 ? 'all' : typeList[index-1])
                            ),
                          );
                        }
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: filteredBreweries.length,
                      itemBuilder: (context, index) {
                        var brewery = filteredBreweries[index];
                        return BreweryTile(brewery: brewery);
                      }
                    ),
                  ),
                ],
              );
            }
            return Container();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
