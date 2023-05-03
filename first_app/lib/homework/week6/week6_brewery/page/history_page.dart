
import 'dart:convert';

import 'package:first_app/homework/week6/week6_brewery/widget/brewery_tile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/brewery.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key, required this.breweries}) : super(key: key);

  final List<Brewery> breweries;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Brewery> _history = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList('history') ?? [];
    setState(() {
      _history = history.map((json) => Brewery.fromMap(jsonDecode(json))).toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: _history.length,
        itemBuilder: (context, index) {
          // _history 리스트의 끝에서부터 역순으로 접근
          final brewery = _history[_history.length - 1 - index];
          return BreweryTile(brewery: brewery);
        },
      ),
    );
  }
}
