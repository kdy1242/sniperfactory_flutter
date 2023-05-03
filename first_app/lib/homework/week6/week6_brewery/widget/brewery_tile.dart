
import 'dart:convert';
import 'dart:developer';

import 'package:first_app/homework/week6/week6_brewery/page/brewery_detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/brewery.dart';
import 'package:flutter/material.dart';

class BreweryTile extends StatelessWidget {
  const BreweryTile({Key? key, required this.brewery}) : super(key: key);

  final Brewery brewery;

  @override
  Widget build(BuildContext context) {

    void _onListItemTap() async {
      final prefs = await SharedPreferences.getInstance();

      // 방문 기록을 가져오고 저장된 데이터가 없으면 빈 리스트를 생성
      final history = prefs.getStringList('history') ?? [];

      log('$history');

      // brewery 객체를 json 문자열로 변환
      final breweryJson = jsonEncode(brewery.toMap());

      // 방문 기록에 json 문자열을 추가
      history.add(breweryJson);

      // prefs 에 방문 기록을 저장
      await prefs.setStringList('history', history);
    }

    return GestureDetector(
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(backgroundImage: NetworkImage(brewery.imgUrl), radius: 48),
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 210,
                      child: Text(
                        brewery.name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(brewery.breweryType),
                    Text('${brewery.city}, ${brewery.state}'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        _onListItemTap();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BreweryDetailPage(brewery: brewery)),
        );
      },
    );
  }
}

