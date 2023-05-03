
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/brewery.dart';
import '../widget/floating_button.dart';
import 'brewery_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> cityList = [];   // 전체 도시 리스트
  List<Brewery> breweries = []; // 양조장 리스트

  Future<List<Brewery>> getData() async {
    Dio dio = Dio();
    String url = 'https://api.openbrewerydb.org/v1/breweries';
    var res = await dio.get(url);

    if (res.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(res.data);
      breweries = data.map((e) => Brewery.fromMap(e)).toList();

      // breweries의 breweryType들을 Set 자료형으로 중복제거 후 리스트로 변환
      cityList = breweries.map((e) => e.city).toSet().toList();
      // cityList 정렬
      cityList.sort((a, b) => a.compareTo(b));

      return breweries;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brewery'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              return ListView.separated(
                itemCount: cityList.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('city', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          Divider(),
                        ],
                      ),
                    );
                  }
                  var city = cityList[index-1];
                  return ListTile(
                    title: Text(city, style: TextStyle(fontSize: 20)),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BreweryPage(city: city)),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider()
              );
            } else {
              return Center(child: Text('null'));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingButton(context, breweries),
    );
  }
}