// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:first_app/homework/week2/day6/DrinkTile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Drink {
  String img;
  String name;
  String engName;
  int price;
  Drink(this.img, this.name, this.engName, this.price);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    List<Drink> drinks = [
      Drink('assets/images/starbucks/Item_drink1.jpeg', '골든 미모사 그린 티', 'Golden Mimosa Green Tea', 6100),
      Drink('assets/images/starbucks/Item_drink2.jpeg', '블랙 햅쌀 고봉 라떼', 'Black Rice Latte', 6300),
      Drink('assets/images/starbucks/Item_drink3.jpeg', '아이스 블랙 햅쌀 고봉 라떼', 'Iced Black Rice Latte', 6300),
      Drink('assets/images/starbucks/Item_drink4.jpeg', '스타벅스 튜메릭 라떼', 'Starbucks Turmeric Latte', 6100),
      Drink('assets/images/starbucks/Item_drink5.jpeg', '아이스 스타벅스 튜메릭 라떼', 'Iced Starbucks Turmeric Latte', 6100),
    ];

    Widget newText = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('NEW', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios, color: Colors.black,),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search, color: Colors.black,),
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),

        body: ListView.builder(
          shrinkWrap: true,
          itemCount: drinks.length + 1,
          itemBuilder: (context, index) {
            int itemIdx = index-1;
            if(index == 0) return newText;
            return DrinkTile(img: drinks[itemIdx].img, name: drinks[itemIdx].name, engName: drinks[itemIdx].engName, price: drinks[itemIdx].price);
          }
        ),

        bottomSheet: Container(
          height: 65,
          padding: EdgeInsets.all(16.0),
          color: Colors.black87,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('주문할 매장을 선택해주세요', style: TextStyle(color: Colors.white),),
              Icon(Icons.expand_more, color: Colors.white,),
            ],
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 2,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Pay'),
            BottomNavigationBarItem(icon: Icon(Icons.coffee), label: 'Order'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Shop'),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'Other'),
          ],
          selectedItemColor: Colors.green,
        ),
      )
    );
  }
}
